Received: from mail-la0-x22f.google.com ([2a00:1450:4010:c03::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1Xh5Us-0004Vb-7E
 for linux-mtd@lists.infradead.org; Wed, 22 Oct 2014 23:39:18 +0000
Received: by mail-la0-f47.google.com with SMTP id pv20so3909322lab.34
 for <linux-mtd@lists.infradead.org>; Wed, 22 Oct 2014 16:38:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20141022085910.GO16128@brian-ubuntu>
References: <1413723867-26767-1-git-send-email-akinobu.mita@gmail.com>
 <20141022085910.GO16128@brian-ubuntu>
Date: Thu, 23 Oct 2014 08:38:54 +0900
Message-ID: <CAC5umygPZSSq1UxU6Z7o_e2DfSZcJopac5o2qdf4V0tj0Gh50g@mail.gmail.com>
Subject: Re: [PATCH v2] nandsim: add id_bytes module parameter
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-10-22 17:59 GMT+09:00 Brian Norris <computersforpeace@gmail.com>:
>> @@ -138,10 +142,11 @@ module_param(cache_file,     charp, 0400);
>>  module_param(bbt,         uint, 0400);
>>  module_param(bch,         uint, 0400);
>>
>> -MODULE_PARM_DESC(first_id_byte,  "The first byte returned by NAND Flash 'read ID' command (manufacturer ID)");
>> -MODULE_PARM_DESC(second_id_byte, "The second byte returned by NAND Flash 'read ID' command (chip ID)");
>> -MODULE_PARM_DESC(third_id_byte,  "The third byte returned by NAND Flash 'read ID' command");
>> -MODULE_PARM_DESC(fourth_id_byte, "The fourth byte returned by NAND Flash 'read ID' command");
>> +MODULE_PARM_DESC(id_bytes,       "The ID bytes returned by NAND Flash 'read ID' command (obsolete)");
>
> A little aggressive on marking this one obsolete, eh? :)

Oops.  Good catch.
