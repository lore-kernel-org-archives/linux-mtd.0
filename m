Message-ID: <4A6EEDFB.4070703@nokia.com>
Date: Tue, 28 Jul 2009 15:24:27 +0300
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: news <rw_nospam@gmx.de>
Subject: Re: UBIFS Corrupt during power failure
References: <C77C279BA71FD14985DC8E75FB265AB702FE53F4@usw-am-xch-02.am.trimblecorp.net>	<1239979018.3390.298.camel@localhost.localdomain>	<C77C279BA71FD14985DC8E75FB265AB7030C4C86@usw-am-xch-02.am.trimblecorp.net>	<200905150916.54091.sr@denx.de>	<1244016510.5847.38.camel@localhost.localdomain>	<C77C279BA71FD14985DC8E75FB265AB703659A64@usw-am-xch-02.am.trimblecorp.net>
	<1244369819.5847.321.camel@localhost.localdomain>
	<4A6EE895.9050008@gmx.de>
In-Reply-To: <4A6EE895.9050008@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Cc: "dedekind@infradead.org" <dedekind@infradead.org>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Eric Holmberg <Eric_Holmberg@Trimble.com>,
	Jamie Lokier <jamie@shareable.org>, Stefan Roese <sr@denx.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

news wrote:
> Artem Bityutskiy schrieb:
>> On Wed, 2009-06-03 at 07:50 -0600, Eric Holmberg wrote:
>>   
>>> Sorry for the delays on getting you real information - I am working on it as much as I can.  Due to our project schedule here, I can only work on this a few minutes a day.
>>>
>>> I have reproduced the CRC error, but looking at the data (shown below), I am not sure what data is expected in LEB 1 at the failed position.  I don't see anything that indicates that the write-buffer behavior that I have avoided by limiting the write-buffer size to 8 bytes is causing the problem.
>>>
>>> [42949375.500000] UBIFS error (pid 1): ubifs_check_node: bad CRC: calculated 0x714960f4, read 0x3dae4f0a
>>> [42949375.510000] UBIFS error (pid 1): ubifs_check_node: bad node at LEB 1:89600
>>> [42949375.520000] UBIFS error (pid 1): ubifs_scanned_corruption: corrupted data at LEB 1:89600
>>> [42949375.540000] UBIFS error (pid 1): ubifs_scan: LEB 1 scanning failed
>>> [42949375.580000] UBIFS error (pid 1): ubifs_recover_master_node: failed to recover master node
>>>
>>> LEB 1:89600 refers to address 0x31c75e00 for the NOR flash and looks like it contains nothing but zeros.
>>>
>>> 31c75e00: 00000000 00000000 00000000 00000000    ................
>>> 31c75e10: 00000000 00000000 00000000 00000000    ................
>>> 31c75e20: 00000000 00000000 00000000 00000000    ................
>>> 31c75e30: 00000000 00000000 00000000 00000000    ................
>>> 31c75e40: 00000000 00000000 00000000 00000000    ................
>>> 31c75e50: 00000000 00000000 00000000 00000000    ................
>>> 31c75e60: 00000000 00000000 00000000 00000000    ................
>>> 31c75e70: 00000000 00000000 00000000 00000000    ................
>>> 31c75e80: 06101831 3dae4f0a 000ecc9b 00000000    1....O.=........
>>>
>>> Since this is the root file system and is 28MB in size, I am working on creating a smaller file system and writing a fixed test pattern to it.  I will provide the dd images of these files along with log files as soon as possible which will hopefully be next Monday (June 8).
>>>
>>> If you have any addition suggestions or requests, please let me know.
>>>     
>> Well, I would be cool to have full UBIFS debugging output, or better
>> the image of the partition.
>>
>>   
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

Artem is on holiday.

Have you read the rest of this thread?  Does any of it help you?
