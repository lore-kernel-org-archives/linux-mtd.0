Received: from wproxy.gmail.com ([64.233.184.197])
	by canuck.infradead.org with esmtp (Exim 4.43 #1 (Red Hat Linux))
	id 1Cqxfy-0003kg-MD
	for linux-mtd@lists.infradead.org; Tue, 18 Jan 2005 13:02:01 -0500
Received: by wproxy.gmail.com with SMTP id 36so114247wra
	for <linux-mtd@lists.infradead.org>;
	Tue, 18 Jan 2005 10:01:54 -0800 (PST)
Message-ID: <6934efce05011810013ea479b@mail.gmail.com>
Date: Tue, 18 Jan 2005 10:01:54 -0800
From: Jared Hulbert <jaredeh@gmail.com>
To: "Artem B. Bityuckiy" <dedekind@infradead.org>
In-Reply-To: <Pine.LNX.4.58.0501131317560.17331@phoenix.infradead.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
References: <Pine.LNX.4.58.0501131219480.17331@phoenix.infradead.org>
	<1105619501.26551.163.camel@hades.cambridge.redhat.com>
	<Pine.LNX.4.58.0501131317560.17331@phoenix.infradead.org>
Cc: MTD List <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>
Subject: Re: CRC on Read-Only partition
Reply-To: Jared Hulbert <jaredeh@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

My understanding is that NAND technology is prone to read error even
if you aren't programming or eraseing it.   Such errors can occur
randomly.  By that I mean the data reads fine and then its bad and
then it reads fine...
