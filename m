Received: from www11.mailshell.com ([209.157.66.249] helo=mailshell.com)
	by pentafluge.infradead.org with smtp (Exim 4.30 #5 (Red Hat Linux))
	id 1AeVdz-00088S-Hd
	for linux-mtd@lists.infradead.org; Thu, 08 Jan 2004 08:35:55 +0000
Message-ID: <20040108083349.28595.qmail@mailshell.com>
In-Reply-To: <004d01c3d5b9$7ed266d0$6e01a8c0@solarwave>
References: <004d01c3d5b9$7ed266d0$6e01a8c0@solarwave>
Content-Type: text/plain
Mime-Version: 1.0
Date: Thu, 08 Jan 2004 16:34:03 +0000
Content-Transfer-Encoding: 7bit
From: daniel@dmhome.net
To: linux-mtd@lists.infradead.org
Subject: RE: Changing parameters on the fly - possible?
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> 
> Additional information: if it helps you to know this, the same problem I
> described also occurs with the 2.4.22-10mdk source tree (when I apply the
> MTD patch).  So I'm just going with the stock drivers and using the 22
> source to build my kernel for now.

That's my suggestion also:  use a vanilla 2.4.22, unless you really need
the Mandrake kernel for something in particular. I have recently
compiled mtd from CVS against 2.4.22 & 2.6.0-test11 without any
problems.

Good luck, 
 
