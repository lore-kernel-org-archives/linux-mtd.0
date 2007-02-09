From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45C2EE39.7050909@nokia.com>
	<003a01c748f0$48530620$c7a3580a@swcenter.sec.samsung.co.kr>
	<45C6DB35.3040106@nokia.com>
	<003d01c748f9$705677c0$c7a3580a@swcenter.sec.samsung.co.kr>
	<1170664239.3628.64.camel@sauron>
	<005a01c74994$b5f5c9c0$c7a3580a@swcenter.sec.samsung.co.kr>
	<45CB2FAC.5020107@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Do not allow oob write past end of page
Date: Fri, 9 Feb 2007 09:20:52 +0900
Message-ID: <003101c74be0$2afa6940$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45CB2FAC.5020107@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

With new oobtest it's passed.
It's same as you

Thank you,
Kyungmin Park

> 
> Seems ok for me:
> 
> oobtest: Attempting to start write past end of oob
> oobtest: An error is expected...
> onenand_write_oob: Attempted to start write outside oob
> oobtest: Error occurred as expected
> oobtest: Attempting to start read past end of oob
> oobtest: An error is expected...
> onenand_read_oob: Attempted to start read outside oob
> oobtest: Error occurred as expected
> oobtest: Attempting to write past end of device
> oobtest: An error is expected...
> onenand_write_oob: Attempted to write past end of device
> oobtest: Error occurred as expected
> oobtest: Attempting to read past end of device
> oobtest: An error is expected...
> onenand_read_oob: Attempted to read beyond end of device
> oobtest: Error occurred as expected
> oobtest: Attempting to write past end of device
> oobtest: An error is expected...
> onenand_write_oob: Attempted to write past end of device
> oobtest: Error occurred as expected
> oobtest: Attempting to read past end of device
> oobtest: An error is expected...
> onenand_read_oob: Attempted to read beyond end of device
> oobtest: Error occurred as expected
> 
