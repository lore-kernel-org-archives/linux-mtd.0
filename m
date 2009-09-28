Received: from smtp.nokia.com ([192.100.105.134] helo=mgw-mx09.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.69 #1 (Red Hat Linux))
	id 1MsEMp-0003OY-JV
	for linux-mtd@lists.infradead.org; Mon, 28 Sep 2009 11:26:12 +0000
Subject: Re: UBIFS Error
From: Artem Bityutskiy <dedekind1@gmail.com>
To: JerinJacob <jerin.jacob@maxim-ic.com>
In-Reply-To: <4AB1F58D.7070809@maxim-ic.com>
References: <4AA5F37F.4050307@maxim-ic.com> <4AA60E6C.6060307@nokia.com>
	<4AA8EA9C.4070805@maxim-ic.com> <4AA8ED7B.5020509@nokia.com>
	<4AA8F6E4.1090209@maxim-ic.com> <4AA90351.3050000@nokia.com>
	<4AAA4005.9080707@maxim-ic.com> <1252938440.5060.102.camel@localhost>
	<1252938588.5060.103.camel@localhost> <4AAF5016.2030809@maxim-ic.com>
	<4AB1F58D.7070809@maxim-ic.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 28 Sep 2009 14:22:29 +0300
Message-Id: <1254136949.3778.58.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: "Artem.Bityutskiy@nokia.com" <Artem.Bityutskiy@nokia.com>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Hunter Adrian \(Nokia-D/Helsinki\)" <adrian.hunter@nokia.com>
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Thu, 2009-09-17 at 14:08 +0530, JerinJacob wrote:
> >
> >> Got a crash  while reading a large mtd device with "mtd_readtest".
> Let me fix this platform specific driver bug.
> Any way this mtd_tests are very use full.
> 
>  >>> Fixed the platform specific driver bug.And all the mtd test case 
> are passing now with zero errors.
> Unfortunately, Still the UBIFS crashing problem persist.

Do you still have UBIFS errors? Any new interesting findings? Did you
manage to somehow reproduce this on nandsim?

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
