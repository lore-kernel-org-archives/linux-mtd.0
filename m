Received: from [81.3.11.18] (helo=mail.ku-gbr.de)
	by canuck.infradead.org with esmtps (Exim 4.43 #1 (Red Hat Linux))
	id 1D14Dh-0002ms-8e
	for linux-mtd@lists.infradead.org; Tue, 15 Feb 2005 10:02:34 -0500
Date: Tue, 15 Feb 2005 16:02:32 +0100
From: Konstantin Kletschke <lists@ku-gbr.de>
To: linux-mtd@lists.infradead.org
Message-ID: <20050215150231.GA831@synertronixx3>
References: <20050214143601.GB27046@synertronixx3>
	<1108463611.26412.27.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1108463611.26412.27.camel@sauron.oktetlabs.ru>
Subject: Re: Oops in 2.6.10-rc2
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 2005-02-15 13:33 +0300 schrieb Artem B. Bityuckiy:

> IIRC, there were some NOR-related bug fixes. I would just see the
> revision of your nodemngmnt.c file and compare with the latest revision.
> I believe the distance is one or two commits. You may port them or just
> use the latest nodemngmnt.c - with high probability it will work well.

Ok, I will try that and fetch a new nodemgmnt.c tomorrow.
Now I am at my XIP construction set :(

Thanks for your help, Konsti

-- 
GPG KeyID EF62FCEF
Fingerprint: 13C9 B16B 9844 EC15 CC2E  A080 1E69 3FDA EF62 FCEF
