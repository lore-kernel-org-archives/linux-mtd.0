Received: from dragon.actrix.co.nz ([203.96.16.164] helo=desire.actrix.co.nz)
	by pentafluge.infradead.org with esmtp (Exim 4.14 #3 (Red Hat Linux))
	id 195CyW-0007FR-Oq
	for <linux-mtd@lists.infradead.org>; Tue, 15 Apr 2003 00:02:57 +0100
From: Charles Manning <manningc2@actrix.gen.nz>
To: esn@cotas.dk, linux-mtd@lists.infradead.org
Date: Tue, 15 Apr 2003 11:03:38 +1200
References: <200304141008.32102.esn@cotas.dk>
In-Reply-To: <200304141008.32102.esn@cotas.dk>
MIME-Version: 1.0
Message-Id: <20030414230258.A173D155EF@desire.actrix.co.nz>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Subject: Re: Database on JFFS2?
Reply-To: manningc2@actrix.gen.nz
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, 14 Apr 2003 20:08, Esben Nielsen wrote:
> Is it posible to run a sql database (mysql forinstance) on a JFFS2
> filesystem?

What kind of flash? NOR flash is very slow for writing, making some database 
solutions impractical. 

People are using NAND with YAFFS in database-like solutions.

-- CHarles
