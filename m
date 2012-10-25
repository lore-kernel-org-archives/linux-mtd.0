Received: from mail-pb0-f49.google.com ([209.85.160.49])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TRVUG-0002cQ-1W
 for linux-mtd@lists.infradead.org; Thu, 25 Oct 2012 22:01:12 +0000
Received: by mail-pb0-f49.google.com with SMTP id xa7so2146481pbc.36
 for <linux-mtd@lists.infradead.org>; Thu, 25 Oct 2012 15:01:09 -0700 (PDT)
Message-ID: <5089B692.1030203@gmail.com>
Date: Fri, 26 Oct 2012 00:00:50 +0200
From: Vincenzo Aliberti <vincenzo.aliberti@gmail.com>
MIME-Version: 1.0
To: dedekind1@gmail.com
Subject: Re: [PATCH] [MTD] MTD driver for LPDDR2-NVM PCM memories
References: <1349385434-3073-1-git-send-email-valibert@micron.com>
 <1349954577.12014.13.camel@sauron.fi.intel.com> <507DD09C.6050600@gmail.com>
 <1350479369.5769.153.camel@sauron.fi.intel.com>
In-Reply-To: <1350479369.5769.153.camel@sauron.fi.intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: arnd@arndb.de, dmanna@micron.com, lporzio@micron.com,
 linux-mtd@lists.infradead.org, valibert@micron.com, svenkatr@ti.com,
 dwmw2@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 10/17/2012 03:09 PM, Artem Bityutskiy wrote:
> On Tue, 2012-10-16 at 23:24 +0200, Vincenzo Aliberti wrote:
>> The only Warning is
>> WARNING: line over 80 characters
>> #605: FILE: include/uapi/mtd/mtd-abi.h:112:
>> +#define MTD_CAP_PCM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
>>
>> But in the file include/uapi/mtd/mtd-abi.h there is already the raw:
>> #define MTD_CAP_RAM		(MTD_WRITEABLE | MTD_BIT_WRITEABLE | MTD_NO_ERASE)
> 
> You can ignore this warning.
> 

Artem, David do you see the need for further changes or do you think it can be
pulled in the main line?
