Received: from dell-paw-3.cambridge.redhat.com ([195.224.55.237] helo=passion.cambridge.redhat.com)
	by pentafluge.infradead.org with esmtp (Exim 3.22 #1 (Red Hat Linux))
	id 16VisY-00038O-00
	for <linux-mtd@lists.infradead.org>; Wed, 30 Jan 2002 00:45:34 +0000
From: David Woodhouse <dwmw2@infradead.org>
In-Reply-To: <D3A72C5007329A4F991C0DD87202259F096A41@sekhmet.ad.newisys.com> 
References: <D3A72C5007329A4F991C0DD87202259F096A41@sekhmet.ad.newisys.com> 
To: "Navin Boppuri" <navin.boppuri@newisys.com>
Cc: linux-mtd@lists.infradead.org
Subject: Re: Problems with mounting a JFFS2 file system image 
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Date: Wed, 30 Jan 2002 00:56:40 +0000
Message-ID: <12083.1012352200@redhat.com>
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

navin.boppuri@newisys.com said:
> jffs2_scan_eraseblock(): Magic bitmask 0x1985 not found at 0x00000000: 0x8519 instead

Your host and target have different endianness. Use the '-b' or '-l' option
to mkfs.jffs2.


--
dwmw2
