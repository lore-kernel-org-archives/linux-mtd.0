Received: from [209.116.120.7] (helo=tnint11.telogy.design.ti.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 17SjUG-0001xi-00
	for <linux-mtd@lists.infradead.org>; Thu, 11 Jul 2002 20:20:24 +0100
Content-Type: text/plain;
  charset="iso-8859-1"
From: Snehaprabha <nsnehaprabha@tnint11.telogy.design.ti.com>
To: David Woodhouse <dwmw2@infradead.org>
Subject: Re: JFFS2 Problem
Date: Thu, 11 Jul 2002 15:18:18 -0400
Cc: linux-mtd@lists.infradead.org
References: <200207101752.51379.nsnehaprabha@tnint11.telogy.design.ti.com> <4554.1026371135@redhat.com>
In-Reply-To: <4554.1026371135@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Message-Id: <200207111518.18733.nsnehaprabha@tnint11.telogy.design.ti.com>
Sender: linux-mtd-admin@lists.infradead.org
Errors-To: linux-mtd-admin@lists.infradead.org
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>

Thanks for the response.
I am running 2.4.17 Kernel. I have a limitation on the flash size (AMD fl=
ash=20
2MB with 64K erase block size). I am running our own bootloader which tak=
es=20
up 3 erase blocks. Then I have the linux kernel that takes around 12 eras=
e=20
blocks, leaving 17 erase blocks for the JFFS2 image. I have managed to fi=
t in=20
most of the required pieces for the file system, which makes it 17 blocks=
=2E=20
Now the question is about the spare erase block required for GC.
I am confused with the #defines in fs/jffs2/nodelist.h

I have almost got it working with following values.

#define JFFS2_RESERVED_BLOCKS_BASE 1 /*3*/
#define JFFS2_RESERVED_BLOCKS_WRITE (JFFS2_RESERVED_BLOCKS_BASE + 1/*2*/)
#define JFFS2_RESERVED_BLOCKS_DELETION (JFFS2_RESERVED_BLOCKS_BASE /*+ 1*=
/)=20
#define JFFS2_RESERVED_BLOCKS_GCTRIGGER (JFFS2_RESERVED_BLOCKS_BASE /*+ 3=
*/)
#define JFFS2_RESERVED_BLOCKS_GCBAD (JFFS2_RESERVED_BLOCKS_BASE + 1)
#define JFFS2_RESERVED_BLOCKS_GCMERGE (JFFS2_RESERVED_BLOCKS_BASE)

I want to know what are correct and reasonable values?

Thanks
Sneha



On Thursday 11 July 2002 03:05 am, David Woodhouse wrote:
> nsnehaprabha@tnint11.telogy.design.ti.com said:
> >  I copy a file, and delete it for several times;  (You can think of a
> > case  where a configuration file is written again and again).
> >
> > Depending on the space I had initially, it reaches a stage, where I
> > cannot   copy the file any more though 'df' shows enough available
> > space for the file.
>
> Until recently there was a bug where we wouldn't reclaim the space if y=
ou
> renamed one file over another. Could it be that? If not, it's not a kno=
wn
> problem.
>
> What version of the JFFS2 code are you using? Do you have a serial cons=
ole?
> Can you set CONFIG_JFFS2_FS_DEBUG=3D1 and set the console loglevel to 9=
 so
> that all the resulting KERN_DEBUG messages are printed, then reproduce =
the
> problem while logging the output?
