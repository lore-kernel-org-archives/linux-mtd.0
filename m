Received: from [202.177.17.107] (helo=donut.udomain.com.hk)
	by pentafluge.infradead.org with smtp (Exim 4.14 #3 (Red Hat Linux))
	id 19jyoi-0002FI-Ei
	for <linux-mtd@lists.infradead.org>; Tue, 05 Aug 2003 11:13:27 +0100
Message-ID: <3F2F8385.5090606@hectrix.com>
Date: Tue, 05 Aug 2003 18:14:29 +0800
From: Selwyn Tang <selwyn@hectrix.com>
MIME-Version: 1.0
To: linux-mtd@lists.infradead.org
References: <3F2F329D.5040204@hectrix.com>
In-Reply-To: <3F2F329D.5040204@hectrix.com>
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Transfer-Encoding: 7bit
Subject: Re: Cannot automake after patching grub with
	grub-2003-01-08-doc.patch
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Dear all,

I solved the problem. It was that I've forgotten to symlink my aclocal, 
which was 1.4p5 from RH7.3, to 1.5, together with automake. After that, 
aclocal, automake and autoconf run successfully, but with the following 
warnings when running autoconf:

   configure.in:17: warning: do not use m4_patsubst: use patsubst or
   m4_bpatsubst
   configure.in:700: warning: do not use m4_regexp: use regexp or
   m4_bregexp

I don't know if they bother, but I got grub_firmware produced.

Selwyn

Selwyn Tang wrote:
> Dear all,
> 
> I downloaded the latest snapshot of grub through cvs and applied 
> grub-2003-01-08-doc.patch with only one rejection in ChangeLog. I then 
> followed README_DiskOnChip to run aclocal successfully. But when I run 
> automake, a lot of "AMDEP does not appear in AM_CONDITIONAL" messages 
> appeared! For examples,
> 
> /usr/share/automake-1.5/am/depend2.am: AMDEP does not appear in 
> AM_CONDITIONAL
> /usr/share/automake-1.5/am/lang-compile.am: AMDEP does not appear in 
> AM_CONDITIONAL
> 
> Before that, I use automake 1.4p5 and when I run automake it told me 
> that 1.5 was expected. Then I ln -s automake to automake-1.5 in my 
> RedHat 7.3, and got the above error.
> 
> Have anyone successfully applied the patch to grub, compiled it and get 
> the "grub_firmware" file in stage1/ ?
> 
> Yours,
> 
> Selwyn
> 
> 
> ______________________________________________________
> Linux MTD discussion mailing list
> http://lists.infradead.org/mailman/listinfo/linux-mtd/
> 
> 
