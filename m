Received: from smtprelay03.ispgateway.de ([80.67.18.15])
	by canuck.infradead.org with esmtp (Exim 4.54 #1 (Red Hat Linux))
	id 1EeVA6-0004r6-2z
	for linux-mtd@lists.infradead.org; Tue, 22 Nov 2005 05:14:10 -0500
Message-ID: <4382EF68.3010204@gmail.com>
Date: Tue, 22 Nov 2005 11:14:00 +0100
From: Bernhard Priewasser <priewasser@gmail.com>
MIME-Version: 1.0
To: Jared Hulbert <jaredeh@gmail.com>
References: <4379B814.3010407@gmail.com>	
	<6934efce0511170958j9df6e3cu6329cf51088416f@mail.gmail.com>	
	<437D9F6F.80102@gmail.com>
	<6934efce0511211418s5317b7a6tee5b391e28eb8491@mail.gmail.com>
In-Reply-To: <6934efce0511211418s5317b7a6tee5b391e28eb8491@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: MTD mailing list <linux-mtd@lists.infradead.org>
Subject: Re: Strange NOR read/write throughput behaviour
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

> What about the read test.

As simple as you can imagine. Write a file (fopen, fwrite, fclose), wait 
some time, read the file (fopen, fread, fclose).
Do you think there are caching mechanism responsible for it?

-- 
Bernhard
