Received: from blood.actrix.co.nz ([203.96.16.160])
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 19I0re-00078h-L7
	for <linux-mtd@lists.infradead.org>; Tue, 20 May 2003 07:44:47 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: Miernik <miernik@ctnet.pl>, linux-mtd@lists.infradead.org
Date: Tue, 20 May 2003 18:47:05 +1200
References: <D3AF5F134D627243993F2F2FC32EE4D229C730@mailman.eason.com>
	<20030506205634.D88B04585@blood.actrix.co.nz>
	<20030520060528.672B.0.NOFFLE@tarnica.miernik.lo>
In-Reply-To: <20030520060528.672B.0.NOFFLE@tarnica.miernik.lo>
MIME-Version: 1.0
Message-Id: <20030520064504.2286C43D5@blood.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: CompactFlash...
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tuesday 20 May 2003 18:05, Miernik wrote:
> In article <20030506205634.D88B04585@blood.actrix.co.nz>, Charles Manning 
wrote:
> > No. Regardless of the hook-up, the functional interface you get is still
> > IDE equivalent. You do not get access to the raw NAND. For that you need
> > something like SmartMedia.
>
> And what about Secure Digital?

I don't know.  Find the spec and tell us :-).

If you can see the chip as raw NAND then we can use it with YAFFS and JFFS2.

-- CHarles
