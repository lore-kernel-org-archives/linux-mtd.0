Received: from outmail1.freedom2surf.net ([194.106.33.237]
	helo=outmail.freedom2surf.net)
	by canuck.infradead.org with esmtp (Exim 4.33 #1 (Red Hat Linux))
	id 1By8Qj-0006LT-Jk
	for linux-mtd@lists.infradead.org; Fri, 20 Aug 2004 08:23:43 -0400
Received: from wirenth (i-195-137-81-187.freedom2surf.net [195.137.81.187])
	by outmail.freedom2surf.net (8.12.10/8.12.10) with SMTP id
	i7KCNWnF009590
	for <linux-mtd@lists.infradead.org>; Fri, 20 Aug 2004 13:23:32 +0100
Date: Fri, 20 Aug 2004 13:23:32 +0100
From: Ian Molton <spyro@f2s.com>
To: linux-mtd@lists.infradead.org
Message-Id: <20040820132332.42c78dcc.spyro@f2s.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Subject: supporting stupid chips
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi.

I've come to the conclusion that my controller only supports word reads from its data register.

the question is, what to do?

My choice would be to provide a read_id function and facility to indicate that read_byte is not available (NULL ptr?). IIRC we can already provide bulk transfer functions anyhow.

If this is OK I can make these changes and submit a patch.

if not, suggestions ?
