From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45BA1A9D.60301@nokia.com> <45BA21E6.60301@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Add support for auto-placement
	ofout-of-band data
Date: Mon, 29 Jan 2007 15:02:23 +0900
Message-ID: <000101c7436b$14370420$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45BA21E6.60301@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Adiran

> 
> Enable the use of oob operation mode MTD_OOB_AUTO with OneNAND.
> Note that MTD_OOB_RAW is still not supported.
> 

It's cool. however how can we test this one?

Just modify JFFS2 oob mode from OOB_PLACE to OOB_AUTO?

Thank you,
Kyungmin Park
