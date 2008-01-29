Received: from [210.94.41.89] (helo=kmpark)
	by bombadil.infradead.org with esmtpsa (Exim 4.68 #1 (Red Hat Linux))
	id 1JJlqA-00013X-Eh
	for linux-mtd@lists.infradead.org; Tue, 29 Jan 2008 08:29:10 +0000
From: "Kyungmin Park" <kmpark@infradead.org>
To: <linux-mtd@lists.infradead.org>
Subject: [GIT PULL] OneNAND updates
Date: Tue, 29 Jan 2008 17:29:03 +0900
Message-ID: <007a01c86251$05ace8b0$1fa9580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

[GIT PULL] OneNAND updates

Please pull git://git.infradead.org/~kmpark/onenand-mtd-2.6

Now I omit the MLC related patches.

Thank you,
Kyungmin Park

[MTD] [OneNAND] Use pre-alloced oob buffer instead of local buffer
[MTD] [OneNAND] Use the u_char instead of char in oobbuf
[MTD] [OneNAND] Check the initial bad block using ONENAND_CTRL_ERROR
[MTD] [OneNAND] Get correct density from device ID
[MTD] [OneNAND] Consolidate OneNAND operation order
[MTD] [OneNAND] fix call to onenand_verify when writing subpages
[MTD] [OneNAND] Do not release chip twice
