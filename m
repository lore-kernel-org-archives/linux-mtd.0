Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 15U5io-0007Vw-00
	for <linux-mtd@lists.infradead.org>; Tue, 07 Aug 2001 13:12:30 +0100
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <001401c11f34$dc14ddc0$110aa8c0@vistatopology.com> 
References: <001401c11f34$dc14ddc0$110aa8c0@vistatopology.com>  <3B67E336.B7925626@hispafuentes.com> <523.997177701@redhat.com> 
To: "Alex Liao" <alex@vistatopology.com>
Cc: "Juan Ramon Jimenez Garcia" <juan@hispafuentes.com>,
    linux-mtd@lists.infradead.org, olea@hispafuentes.com
Subject: Re: Problems compiling kernel 2.2.1-rmk2 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Tue, 07 Aug 2001 13:16:55 +0100
Message-ID: <25107.997186615@redhat.com>
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


alex@vistatopology.com said:
>        cfi_cmdset_0002.c:206: dereferencing pointer to incomplete type 
>        cfi_cmdset_0002.c:208: dereferencing pointer to incomplete type
>        cfi_cmdset_0002.c:209: dereferencing pointer to incomplete type

Check the contents of your include/linux/mtd directory are from the same
version as your drivers/mtd directory.






--
dwmw2
