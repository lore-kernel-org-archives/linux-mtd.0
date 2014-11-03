Message-ID: <5456D867.5020303@fb.com>
Date: Sun, 2 Nov 2014 18:20:39 -0700
From: Jens Axboe <axboe@fb.com>
MIME-Version: 1.0
To: Richard Weinberger <richard@nod.at>, Ezequiel Garcia
 <ezequiel.garcia@free-electrons.com>,
 <hch@infradead.org>, <dedekind1@gmail.com>
Subject: Re: [PATCH] UBI: Block: Add blk-mq support
References: <1414933255-3795-1-git-send-email-richard@nod.at>
 <5456A787.5060104@free-electrons.com> <5456AE72.1010409@nod.at>
 <5456AFEA.6000507@free-electrons.com> <5456B4F8.1000608@nod.at>
In-Reply-To: <5456B4F8.1000608@nod.at>
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

On 2014-11-02 15:49, Richard Weinberger wrote:
> AFAICT blk-mq allocates one struct ubiblock_pdu per device.
> As all IO is done via scattergather the memory footprint should be good.
> But I'm sure Christoph can tell you the glory details.

That is true, the request list and pdu is allocated upfront. If that is 
a problem, the pdu need not be allocated upfront but could be done at IO 
time instead. With that comes a bit more complicated retry handling, for 
memory shortage situations.

-- 
Jens Axboe
