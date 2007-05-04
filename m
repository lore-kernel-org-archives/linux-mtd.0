Received: from ug-out-1314.google.com ([66.249.92.174])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1Hk5Xe-0005Ja-Pm
	for linux-mtd@lists.infradead.org; Fri, 04 May 2007 17:42:20 -0400
Received: by ug-out-1314.google.com with SMTP id m2so603636uge
	for <linux-mtd@lists.infradead.org>;
	Fri, 04 May 2007 14:42:13 -0700 (PDT)
Message-ID: <a781481a0705041442h37453fb6k26d04eb5356e9dc0@mail.gmail.com>
Date: Sat, 5 May 2007 03:12:02 +0530
From: "Satyam Sharma" <satyam.sharma@gmail.com>
To: "Florin Malita" <fmalita@gmail.com>
Subject: Re: [PATCH] UBI: dereference after kfree in create_vtbl
In-Reply-To: <463A04A5.5030103@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <463A04A5.5030103@gmail.com>
Cc: linux-mtd@lists.infradead.org,
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Florin, Artem,

On 5/3/07, Florin Malita <fmalita@gmail.com> wrote:
> [...]
>  write_error:
> -       kfree(new_seb);
> -       /* May be this physical eraseblock went bad, try to pick another one */
> -       if (++tries <= 5) {
> +       /* Maybe this physical eraseblock went bad, try to pick another one */
> +       if (++tries <= 5)
>                 err = ubi_scan_add_to_list(si, new_seb->pnum, new_seb->ec,
>                                            &si->corr);
> -               if (!err)
> -                       goto retry;
> -       }
> +       kfree(new_seb);
> +       if (!err)
> +               goto retry;

Eeks ... no, wait. You found a (two, actually) bug alright, but fixed
it wrong. When we fail a write, we *must* add it to the corrupted list
and _then_ attempt to retry. So, the "if (++tries <= 5)" applies to
"if (!err) goto retry;" and not to the ubi_scan_add_to_list(). The
difference is quite subtle here ...

The correct fix should actually be as follows: (Artem, this is diffed
on the original vtbl.c)

---

Fix write_error logic in drivers/mtd/ubi/vtbl.c:create_vtbl(). On a
write failure, we add the corrupted physical eraseblock to the
corrupted list, and then attempt to retry (upto a maximum of 5 times).
Also, fix an oops by pushing kfree(new_seb) below after dereferencing
it for ubi_scan_add_to_list().

Signed-off-by: Satyam Sharma <ssatyam@cse.iitk.ac.in>
Signed-off-by: Florin Malita <fmalita@gmail.com>

---

 drivers/mtd/ubi/vtbl.c |    8 +++-----
 1 file changed, 3 insertions(+), 5 deletions(-)

---

diff -ruNp a/drivers/mtd/ubi/vtbl.c b/drivers/mtd/ubi/vtbl.c
--- a/drivers/mtd/ubi/vtbl.c	2007-04-20 18:42:17.000000000 +0530
+++ b/drivers/mtd/ubi/vtbl.c	2007-05-05 03:01:32.000000000 +0530
@@ -317,14 +317,12 @@ retry:
 	return err;

 write_error:
-	kfree(new_seb);
 	/* May be this physical eraseblock went bad, try to pick another one */
-	if (++tries <= 5) {
-		err = ubi_scan_add_to_list(si, new_seb->pnum, new_seb->ec,
-					   &si->corr);
+	err = ubi_scan_add_to_list(si, new_seb->pnum, new_seb->ec, &si->corr);
+	kfree(new_seb);
+	if (++tries <= 5)
 		if (!err)
 			goto retry;
-	}
 out_free:
 	ubi_free_vid_hdr(ubi, vid_hdr);
 	return err;
