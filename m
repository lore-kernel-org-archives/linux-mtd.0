Received: from smtp.nokia.com ([192.100.122.230] helo=mgw-mx03.nokia.com)
	by bombadil.infradead.org with esmtps (Exim 4.72 #1 (Red Hat Linux))
	id 1OYWif-0004Qq-5Z
	for linux-mtd@lists.infradead.org; Tue, 13 Jul 2010 04:03:46 +0000
Subject: Re: ubifs became broken on contigous power-fails
From: Artem Bityutskiy <dedekind1@gmail.com>
To: pazdnikov@prosoftsystems.ru
In-Reply-To: <201006151102.01851.pazdnikov@prosoft.ural.ru>
References: <E1OBqfw-0002Rs-00.pazdnikov-list-ru@f27.mail.ru>
	<1274694991.22999.52.camel@localhost>
	<1276352575.19028.121.camel@localhost>
	<201006151102.01851.pazdnikov@prosoft.ural.ru>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 13 Jul 2010 06:58:38 +0300
Message-ID: <1278993518.16634.101.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Cc: linux-mtd@lists.infradead.org
Reply-To: dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, 2010-06-15 at 11:02 +0600, Alexander Pazdnikov wrote:
> Artem, thank you very much, yes - it helped, all of 10 testing devices 
> survived with repeatable powerfails (1,2,3,4,5,6,7,8,9,10 minutes in this 
> sequence) for a week.
> Now we leave 3 devices for this test.

OK, I finally pushed the fix to the ubifs-2.6.git tree and will merge it
next merge window:

http://git.infradead.org/ubifs-2.6.git/commit/6fb4374f6b1b3932f3acfe9d353568d3d8599cad

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
