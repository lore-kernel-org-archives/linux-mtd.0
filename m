Received: from twosheds.infradead.org ([2001:8b0:10b:1:21d:7dff:fe04:dbe2])
 by bombadil.infradead.org with esmtps (Exim 4.90_1 #2 (Red Hat Linux))
 id 1gKS6V-0001OU-5y
 for linux-mtd@lists.infradead.org; Wed, 07 Nov 2018 17:58:59 +0000
Message-ID: <df9cdf1753ec7e6e20c12aa096b98453.squirrel@twosheds.infradead.org>
In-Reply-To: <20181107173303.slnb3i2d6ufaonp7@zorba>
References: <20181106214928.40020-1-nkela@cisco.com>
 <921b0f78cf67d7307a0555e1fd6f2c2976310adc.camel@infradead.org>
 <1e4c066d1896e2a0b8b146253d34d05cc4f9ab36.camel@infinera.com>
 <8b08e8b992093453bb2b9caff8cff08c.squirrel@twosheds.infradead.org>
 <20181107173303.slnb3i2d6ufaonp7@zorba>
Date: Wed, 7 Nov 2018 17:58:53 -0000
Subject: Re: [PATCH] jffs2: implement mount option to configure endianness
From: "David Woodhouse" <dwmw2@infradead.org>
To: "Daniel Walker" <danielwa@cisco.com>
Cc: "David Woodhouse" <dwmw2@infradead.org>,
 "Joakim Tjernlund" <joakim.tjernlund@infinera.com>,
 "nkela@cisco.com" <nkela@cisco.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "xe-linux-external@cisco.com" <xe-linux-external@cisco.com>
MIME-Version: 1.0
Content-Type: text/plain;charset=utf-8
Content-Transfer-Encoding: 8bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


> On Wed, Nov 07, 2018 at 04:12:14PM -0000, David Woodhouse wrote:
>>
>> > Yes, this may slow things down. I am not sure I agree with the impl.
>> > either.
>> > Could one not make cpu_to_je_X/jeX_to_cpu a function ptr which is set
>> to
>> > a func. with the correct endian?
>>
>> On x86 retpoline would make that quite slow.
>
> Is x86 the largest consumer of jffs2 ?

Certainly not. I'm not sure which architectures do have Spectre V2
mitigations which make indirect branches expensive now... perhaps there is
no intersection with the cases where we really care about JFFS2 being
CPU-bound?


-- 
dwmw2
