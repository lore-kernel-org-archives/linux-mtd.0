Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1LUIo8-0001Cz-0q
	for linux-mtd@lists.infradead.org; Tue, 03 Feb 2009 10:47:10 +0000
Subject: Re: Regarding UBI scalability
From: Artem Bityutskiy <dedekind@infradead.org>
To: Corentin Chary <corentin.chary@gmail.com>
In-Reply-To: <71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
References: <31956721.196931233319535527.JavaMail.weblogic@epml10>
	<1233567078.7085.62.camel@localhost.localdomain>
	<618F1BB69C6C43C895C260C527C4F159@sisodomain.com>
	<4986D3F6.5030208@nokia.com>
	<1233572259.7085.64.camel@localhost.localdomain>
	<4986D677.3020500@nokia.com>
	<71cd59b00902021544w594d4acandc0183bc523aafb0@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 03 Feb 2009 12:46:55 +0200
Message-Id: <1233658015.24809.105.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: Amit Kumar Sharma <amitsharma.9@samsung.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Adrian Hunter <ext-adrian.hunter@nokia.com>,
	"brij.singh@samsung.com" <brij.singh@samsung.com>
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2009-02-03 at 00:44 +0100, Corentin Chary wrote:
> I was wondering how it is possible to get atomic operations using such tables ?
> The first thing that come to my mind is TFAT (two tables, one for
> operation in progress,
> the other considered as always "valid"). But I'm not sure it' the good
> way to do such a thing.

Journal + commit mechanisms should allow doing this.

-- 
Best regards,
Artem Bityutskiy (Битюцкий Артём)
