Received: from wx-out-0506.google.com ([66.249.82.235])
	by canuck.infradead.org with esmtp (Exim 4.63 #1 (Red Hat Linux))
	id 1ITefd-0004FV-EW
	for linux-mtd@lists.infradead.org; Fri, 07 Sep 2007 10:18:56 -0400
Received: by wx-out-0506.google.com with SMTP id s7so426237wxc
	for <linux-mtd@lists.infradead.org>;
	Fri, 07 Sep 2007 07:18:52 -0700 (PDT)
Message-ID: <f96d234e0709070718i6f7ea6dcj91950d8fbc20cea7@mail.gmail.com>
Date: Fri, 7 Sep 2007 10:18:51 -0400
From: "Cliff Brake" <cliff.brake@gmail.com>
To: "Saravanan Chanemouganandam" <schane@osmozis.com>
Subject: Re: sofware updates using initramfs
In-Reply-To: <200709071512.02117.schane@osmozis.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <200709071512.02117.schane@osmozis.com>
Cc: linux-arm@lists.arm.linux.org.uk, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 9/7/07, Saravanan Chanemouganandam <schane@osmozis.com> wrote:
> Hi all,
>
> On my pxa270 board, I want to perform kernel and main rootfs updates using a
> small rootfs ( initramfs) flashed on the NOR.
> Can anybody provide me a good descriptive stuffs on the above software updates
> using initramfs?

I have implemented a similar update scheme on several projects -- a few notes:

http://bec-systems.com/web/content/view/66/9/
http://bec-systems.com/web/content/view/65/9/

uclibc support for ARM is now pretty decent in OpenEmbedded, so what I
typically do now is build a small nor image using uclibc, and the main
rootfs using glibc.

Cliff

-- 
=======================
Cliff Brake
http://bec-systems.com
