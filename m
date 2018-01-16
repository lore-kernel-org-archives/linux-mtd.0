Received: from szxga04-in.huawei.com ([45.249.212.190] helo=huawei.com)
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ebKZx-0005qw-Hu
 for linux-mtd@lists.infradead.org; Tue, 16 Jan 2018 06:18:40 +0000
Subject: Re: [RFC PATCH] ubifs: Add zstd support
To: Richard Weinberger <richard@nod.at>
CC: <dedekind1@gmail.com>, <adrian.hunter@intel.com>,
 <linux-kernel@vger.kernel.org>, <linux-mtd@lists.infradead.org>
References: <20180112092421.22095-1-yuyufen@huawei.com>
 <7790203.HFZG64yrZx@blindfold>
From: yuyufen <yuyufen@huawei.com>
Message-ID: <7c454b10-6bec-8123-e750-7e6e4772b76e@huawei.com>
Date: Tue, 16 Jan 2018 14:16:44 +0800
MIME-Version: 1.0
In-Reply-To: <7790203.HFZG64yrZx@blindfold>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2018/1/12 18:45, Richard Weinberger wrote:
> Yufen Yu,
>
> Am Freitag, 12. Januar 2018, 10:24:21 CET schrieb Yufen Yu:
>> Add zstd compression and decompression support to ubifs. zstd at its
>> fastest level compresses almost as well as zlib, while offering much
>> faster compression and decompression, approaching lzo speeds.
>>
>> This patch is based on the patch:
>> 	https://patchwork.kernel.org/patch/9892631/
>>
>> zstd source repository: https://github.com/facebook/zstd
> Do you have numbers on how much we gain for UBIFS on a typical embedded
> device?
>
> Thanks,
> //richard
>
> .
>

This is a RFC patch. I will post the test results after the full 
function completing.

Thanks a lot.

Yufen Yu
