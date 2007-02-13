Received: from ug-out-1314.google.com ([66.249.92.168])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1HH2gg-0008Po-I1
	for linux-mtd@lists.infradead.org; Tue, 13 Feb 2007 13:47:37 -0500
Received: by ug-out-1314.google.com with SMTP id m2so391604uge
	for <linux-mtd@lists.infradead.org>;
	Tue, 13 Feb 2007 10:47:28 -0800 (PST)
Message-ID: <f383264b0702131047r19254b52nf6f38882164ce588@mail.gmail.com>
Date: Tue, 13 Feb 2007 10:47:27 -0800
From: "Matt Reimer" <mattjreimer@gmail.com>
To: "Matthieu CASTET" <matthieu.castet@parrot.fr>
Subject: Re: [PATCH] S3C2412 TACLS rate calculation fix
In-Reply-To: <loom.20070213T122031-705@post.gmane.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <20070213111204.GC2211@fluff.org.uk>
	<loom.20070213T122031-705@post.gmane.org>
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2/13/07, Matthieu CASTET <matthieu.castet@parrot.fr> wrote:
> Ben Dooks <ben <at> fluff.org.uk> writes:
>
> >
> > The TALCs value on the S3C2412 value does not have
> > an +1 adjustment unlike the S3C2410 and S3C2440.
> >
> > The TALCs value on the S3C2440 is only 2 bits instead
> > of three, so change it to a maximum of 4.
> >
> > Re-work of an patch by Matt Reimer <mreimer <at> vpop.net>
> >
> Doesn't we lose the part that allow tacls to be 0 ?

Yes, we need that so 2410 can use 0 (which translates to 10 ns).

Also, I sent another patch that seems to have gotten hung up by the ml:

--- a/drivers/mtd/nand/s3c2410.c        Tue Jan 30 12:15:08 2007
+++ b/drivers/mtd/nand/s3c2410.c.patched        Tue Jan 30 12:15:08 2007
@@ -159,7 +159,8 @@ static int s3c_nand_calc_rate(int wanted
        int result;

        result = (wanted * clk) / NS_IN_KHZ;
-       result++;
+       if (((wanted * clk) % NS_IN_KHZ) != 0)
+               result++;

        pr_debug("result %d from %ld, %d\n", result, clk, wanted);

(Thanks the in-line clue Ben.)

Matt
