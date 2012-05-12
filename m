Received: from mail-yx0-f177.google.com ([209.85.213.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SSzt9-0005Vp-SS
 for linux-mtd@lists.infradead.org; Sat, 12 May 2012 00:08:49 +0000
Received: by yenr9 with SMTP id r9so3767940yen.36
 for <linux-mtd@lists.infradead.org>; Fri, 11 May 2012 17:08:45 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1074804305.215687.1336714462469.JavaMail.root@sz0162a.emeryville.ca.mail.comcast.net>
References: <1074804305.215687.1336714462469.JavaMail.root@sz0162a.emeryville.ca.mail.comcast.net>
Date: Fri, 11 May 2012 17:08:45 -0700
Message-ID: <CAN8TOE9kuC2S_Jh3aMnMDkkh5KFQUV4AsV9HN+a1UODGYvEbew@mail.gmail.com>
Subject: Re: how do I backup a jffs2 partition to an image file
From: Brian Norris <computersforpeace@gmail.com>
To: geraldwalden@comcast.net
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, May 10, 2012 at 10:34 PM,  <geraldwalden@comcast.net> wrote:
> how do I backup a jffs2 partition to a ".bin" file. I want to run jffs2dump on a jffs2 filesystem, and the utility only takes an image file as a parameter.

Right, jffs2dump is not the right tool.

Are you using NAND, or some other bad-block-free flash (e.g., NOR)?

For NAND, I think the nanddump utility would suffice. It is the
complement of nandwrite, which is mentioned for copying an image *to*
the device:
http://www.linux-mtd.infradead.org/faq/nand.html#L_nand_copyimg

For bad-block-free devices, you aren't restricted, and may be able to
just use dd, for instance. See the information regarding *writing* an
image for my rationale:
http://www.linux-mtd.infradead.org/faq/jffs2.html#L_putimage

But I'm not a JFFS2 expert...

Brian
