Received: from kukac.halom.u-szeged.hu ([160.114.44.1])
	by canuck.infradead.org with esmtp (Exim 4.42 #1 (Red Hat Linux))
	id 1CRRlk-0007Uq-L3
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 03:54:29 -0500
Received: from detonator.halminet.halom.u-szeged.hu ([10.0.0.2]
	helo=mail.halom.u-szeged.hu)
	by kukac.halom.u-szeged.hu with asmtp (TLS-1.0:RSA_ARCFOUR_SHA:16)
	(Exim 4.34) id 1CRRlg-0001gG-BM
	for linux-mtd@lists.infradead.org; Tue, 09 Nov 2004 09:54:24 +0100
Date: Tue, 09 Nov 2004 09:54:22 +0100
From: "Kluba, Patrik" <pajko@halom.u-szeged.hu>
To: linux-mtd@lists.infradead.org
References: <20041109083203.11121.qmail@sina.com.tw>
Content-Type: text/plain; format=flowed; delsp=yes; charset=iso-8859-2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Message-ID: <opsg6wcwrvwtryne@mail.halom.u-szeged.hu>
In-Reply-To: <20041109083203.11121.qmail@sina.com.tw>
Subject: Re: combine 2 mtds into a single mtd device?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Hi!

Look at drivers/mtdconcat.c. This implements a device concatenation layer.
Every function is included to handle multiple MTD devices as a virtual
one. The virtual device must be created with the exported
mtd_concat_create function, and must be destroyed with the
mtd_concat_destroy after use. This function does not register devices, you
should write a module which calls mtd_concat_create with proper parameters
and registers the newly created device.
For example, drivers/mtd/maps/dilnetpc.c is a good starting point.

--
pajko


On Tue, 09 Nov 2004 16:32:02 +0800, <mjabe@sina.com.tw> wrote:

> The follow is my MTD partition:
>
> How to combine MTD1 and MTD2 into a single mtd device?
