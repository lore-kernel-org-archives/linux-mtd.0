Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Yzj0y-0003vx-9U
 for linux-mtd@lists.infradead.org; Tue, 02 Jun 2015 10:01:45 +0000
Message-ID: <556D7EF1.6010305@nod.at>
Date: Tue, 02 Jun 2015 12:01:21 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Sheng Yong <shengyong1@huawei.com>
Subject: Re: [RFC PATCH v2 0/6] UBI: Some cleanup and check if a vol exists
 when fastmap attaching
References: <1432634830-129590-1-git-send-email-shengyong1@huawei.com>
 <556CFB0D.6030805@huawei.com>
In-Reply-To: <556CFB0D.6030805@huawei.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 02.06.2015 um 02:38 schrieb Sheng Yong:
> Ping.
> 
> On 5/26/2015 6:07 PM, Sheng Yong wrote:
>> Hi, folks,
>>
>> V2:
>> * change the commit message of PATCH 5. In normal cases, including unclean
>>   reboot and ECC scenario, there is no way to have two same vol_id saved in
>>   different slots in ubi->volumes[], so add_vol() in fastmap attach won't
>>   go wrong. Only if the on-flash fastmap is modified by hand, this issue
>>   may be triggered.
>>   Thanks Richard Weinberger for pointing this out.
>>
>> * add two more cleanup.
>>   . add a helper function for updatting on-flash layout volumes. No
>>     semantic changes.
>>
>> V1:
>> http://lists.infradead.org/pipermail/linux-mtd/2015-May/059355.html
>>
>> Thanks,
>> Sheng
>>
>> Sheng Yong (6):
>>   UBI: Fastmap: Use max() to get the larger value
>>   UBI: Fastmap: Remove unnecessary `\'
>>   UBI: Fastmap: Rename variables to make them meaningful
>>   UBI: Init vol->reserved_pebs by assignment
>>   UBI: Fastmap: Do not add vol if it already exists
>>   UBI: add a helper function for updatting on-flash layout volumes
>>
>>  drivers/mtd/ubi/build.c   |  4 +--
>>  drivers/mtd/ubi/fastmap.c | 81 +++++++++++++++++++++++++----------------------
>>  drivers/mtd/ubi/vmt.c     |  4 +--
>>  drivers/mtd/ubi/vtbl.c    | 45 ++++++++++++++------------
>>  4 files changed, 72 insertions(+), 62 deletions(-)

Thanks you Sheng, all 6 patches are applied now!
BTW: You could also remove `\' from other places in UBI.

Thanks,
//richard
