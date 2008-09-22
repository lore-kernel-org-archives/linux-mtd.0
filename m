Received: from mail-gx0-f12.google.com ([209.85.217.12])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1Kheox-0001Wt-B0
	for linux-mtd@lists.infradead.org; Mon, 22 Sep 2008 06:22:55 +0000
Received: by gxk5 with SMTP id 5so2700965gxk.18
	for <linux-mtd@lists.infradead.org>;
	Sun, 21 Sep 2008 23:22:54 -0700 (PDT)
Message-ID: <9c9fda240809212322h4d9ac26eqfd7c3cfb9630c97b@mail.gmail.com>
Date: Mon, 22 Sep 2008 15:22:54 +0900
From: "Kyungmin Park" <kmpark@infradead.org>
Sender: kyungmin78@gmail.com
To: moorthy.apg@samsung.com
Subject: Re: [PATCH] [MTD-UTILS] Add support for 4KB page flash devices
In-Reply-To: <33142758.53091221828088797.JavaMail.weblogic@epml16>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <33142758.53091221828088797.JavaMail.weblogic@epml16>
Cc: linux-mtd@lists.infradead.org, David.Woodhouse@intel.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

On Fri, Sep 19, 2008 at 9:41 PM, AYYANARPONNUSAMY GANGHEYAMOORTHY
<moorthy.apg@samsung.com> wrote:
> We can now use these utilities on 4KB devices.
>
> Signed-off-by: Rohit Hagargundgi <h.rohit@samsung.com>
> ---
> --- a/flash_otp_write.c 2008-06-27 21:51:28.000000000 +0530
> +++ b/flash_otp_write.c 2008-07-01 16:04:12.000000000 +0530
> @@ -18,7 +18,7 @@ int main(int argc,char *argv[])
>        int fd, val, ret, size, wrote, len;
>        mtd_info_t mtdInfo;
>        off_t offset;
> -       char *p, buf[2048];
> +       char *p, buf[4096];
>

Is it no problem the stack overflow in application?
How about to use malloc & free?

Thank you,
Kyungmin Park
