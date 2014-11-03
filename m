Message-ID: <5456D7F5.10308@fb.com>
Date: Sun, 2 Nov 2014 18:18:45 -0700
From: Jens Axboe <axboe@fb.com>
MIME-Version: 1.0
To: Ezequiel Garcia <ezequiel.garcia@free-electrons.com>, Richard Weinberger
 <richard@nod.at>, <hch@infradead.org>, <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: Block: Add blk-mq support
References: <1414933255-3795-1-git-send-email-richard@nod.at>
 <5456A787.5060104@free-electrons.com>
In-Reply-To: <5456A787.5060104@free-electrons.com>
Content-Type: text/plain; charset="windows-1252"; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, computersforpeace@gmail.com,
 dwmw2@infradead.org, linux-kernel@vger.kernel.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 2014-11-02 14:52, Ezequiel Garcia wrote:
> Hi Richard,
>
> On 11/02/2014 10:00 AM, Richard Weinberger wrote:
>> Convert the driver to blk-mq.
>>
>
> Maybe you can explain a bit better what's this all about?
>
> Both the commit that introduces blk-mq and the paper on it talk about
> high IOPS devices, multi-core, NUMA systems. I'm not sure this is the
> case for UBI-based devices.

The goal of blk-mq was to solve the issues around those systems, while 
at the same time provide a more modern infrastructure in general. It was 
never the intent to make blk-mq exclusive to higher end systems or 
devices, in fact quite the opposite. The goal is to slowly deprecate the 
old IO stack and switch everything (as far as we can) to blk-mq.

-- 
Jens Axboe
