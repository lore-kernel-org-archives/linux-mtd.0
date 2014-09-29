Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XYZe1-0003OG-3b
 for linux-mtd@lists.infradead.org; Mon, 29 Sep 2014 12:01:34 +0000
Message-ID: <54294A01.8070505@nod.at>
Date: Mon, 29 Sep 2014 14:01:05 +0200
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Kiran Padwal <kiran.padwal21@gmail.com>,
 Tanya Brokhman <tlinder@codeaurora.org>
Subject: Re: [PATCH] mtd: ubi: Extend UBI layer debug/messaging capabilities
References: <1411886185-7838-1-git-send-email-tlinder@codeaurora.org>
 <54293975.9040402@gmail.com>
In-Reply-To: <54293975.9040402@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: Artem Bityutskiy <dedekind1@gmail.com>, linux-arm-msm@vger.kernel.org,
 open list <linux-kernel@vger.kernel.org>, dedeking1@gmail.com,
 linux-mtd@lists.infradead.org, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 29.09.2014 12:50, schrieb Kiran Padwal:
> Hi Tanya,
> 
> On Sunday 28 September 2014 12:06 PM, Tanya Brokhman wrote:
>> If there is more then one UBI device mounted, there is no way to
>> distinguish between messages from different UBI devices.
>> Add device number to all ubi layer message types.
>>
>>
>> Signed-off-by: Tanya Brokhman <tlinder@codeaurora.org>
>>
>> ---
>>  drivers/mtd/ubi/attach.c  | 138 ++++++++++++++++++++----------------
>>  drivers/mtd/ubi/build.c   | 130 ++++++++++++++++++++--------------
>>  drivers/mtd/ubi/cdev.c    |  37 +++++-----
>>  drivers/mtd/ubi/debug.c   |   9 +--
>>  drivers/mtd/ubi/eba.c     |  54 +++++++-------
>>  drivers/mtd/ubi/fastmap.c | 108 ++++++++++++++++------------
>>  drivers/mtd/ubi/io.c      | 177 +++++++++++++++++++++++++++-------------------
>>  drivers/mtd/ubi/kapi.c    |   6 +-
>>  drivers/mtd/ubi/misc.c    |   6 +-
>>  drivers/mtd/ubi/ubi.h     |  13 ++--
>>  drivers/mtd/ubi/vmt.c     |  76 +++++++++++---------
>>  drivers/mtd/ubi/vtbl.c    |  54 ++++++++------
>>  drivers/mtd/ubi/wl.c      |  87 +++++++++++++++--------
>>  13 files changed, 521 insertions(+), 374 deletions(-)
> 
> Compilation breaks while I try to compile with this patch.
> May be you need to update remaining ubi layer messages also.

Please always share the errors you face.
Maybe you have a different config.

Thanks,
//richard
