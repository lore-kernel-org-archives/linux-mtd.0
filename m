Message-ID: <4A7E57B0.6080602@gmail.com>
Date: Sun, 09 Aug 2009 07:59:28 +0300
From: Artem Bityutskiy <dedekind1@gmail.com>
MIME-Version: 1.0
To: news <rw_nospam@gmx.de>
Subject: Re: UBIFS Corrupt during power failure
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>	<1239979018.3390.298.camel@localhost.localdomain>	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>	<200905150916.54091.sr@denx.de>	<1244016510.5847.38.camel@localhost.localdomain>	<C77C279BA71FD14985DC8E75FB265AB703659A64@usw-am-xch-02.am.trimblecorp.net>	<1244369819.5847.321.camel@localhost.localdomain>
	<4A6EE895.9050008@gmx.de>
In-Reply-To: <4A6EE895.9050008@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Cc: Eric Holmberg <Eric_Holmberg@Trimble.com>, dedekind@infradead.org,
	Jamie Lokier <jamie@shareable.org>,
	linux-mtd@lists.infradead.org, Stefan Roese <sr@denx.de>,
	Adrian Hunter <adrian.hunter@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 07/28/2009 03:01 PM, news wrote:
> We have similar problems with a SPANSION falsh (S29GL01GP).
> I think the reason of the problem is a feature of the chip.
>
> I reduced the problem to the MTD access (without ubi/ubifs).
> We noticed toggle flash-bit(s) after power off during a write cycle.
> The toggle flash-bit(s) may occure after power of during an sector-erase
> too.
>
> Simple testsequence:
> * flash_erase ...
> * cp testfile /dev/mtd0
> - automatic or manuel power off during the cp
> Check the flash after reboot (e.g md5sum /dev/mtd0 helps).
>
> We used the default settings from the CFI (MaxBufWriteSize=6 == 64 byte
> buffer).

This was fixed. See the latest UBI/UBIFS git trees. The fixes are also
in the back-port trees:
http://www.linux-mtd.infradead.org/doc/ubifs.html#L_source

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)
