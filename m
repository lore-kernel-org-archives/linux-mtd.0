From: "Kyungmin Park" <kmpark@infradead.org>
To: "'Adrian Hunter'" <ext-adrian.hunter@nokia.com>,
	<linux-mtd@lists.infradead.org>
References: <45CAF5C6.9020105@nokia.com>
Subject: RE: [PATCH] [MTD] OneNAND: Select correct chip's bufferRAM for DDP
Date: Fri, 9 Feb 2007 09:19:33 +0900
Message-ID: <003001c74bdf$fbbb3a10$c7a3580a@swcenter.sec.samsung.co.kr>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="ks_c_5601-1987"
Content-Transfer-Encoding: 7bit
In-reply-to: <45CAF5C6.9020105@nokia.com>
Reply-To: kmpark@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi,

> 
> OneNAND double-density package (DDP) has two chips, each with 
> their own bufferRAM.  The driver will skip loading data from 
> the NAND core if the data can be found in a bufferRAM, 
> however in that case, the correct chip's bufferRAM must be 
> selected before reading from bufferRAM.
>

Ah, I missed the OneNAND DDP test.
I'll push it

Thank you,
Kyungmin Park 
