Received: from mail-wm0-x235.google.com ([2a00:1450:400c:c09::235])
 by bombadil.infradead.org with esmtps (Exim 4.89 #1 (Red Hat Linux))
 id 1ejiX5-0001Yk-60
 for linux-mtd@lists.infradead.org; Thu, 08 Feb 2018 09:30:20 +0000
Received: by mail-wm0-x235.google.com with SMTP id i186so8177459wmi.4
 for <linux-mtd@lists.infradead.org>; Thu, 08 Feb 2018 01:30:07 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <90ae15e2-3d17-54ba-da6e-2891de35bd3e@pengutronix.de>
References: <b299064c-29b2-b496-fa0a-3cccc796064e@pengutronix.de>
 <82f112c2-e0a0-1256-766d-b879d933133c@pengutronix.de>
 <90ae15e2-3d17-54ba-da6e-2891de35bd3e@pengutronix.de>
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Thu, 8 Feb 2018 10:30:05 +0100
Message-ID: <CAFLxGvz+TGZXxNF5xmszcnhPQNHYkqJPRXYp-hxUnEt7+sC0fQ@mail.gmail.com>
Subject: Re: iotop like tool for mtd devices
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Marc,

On Wed, Feb 7, 2018 at 8:31 PM, Marc Kleine-Budde <mkl@pengutronix.de> wrote:
> On 02/07/2018 07:21 PM, Marc Kleine-Budde wrote:
>> On 02/07/2018 02:40 PM, Marc Kleine-Budde wrote:
>>> as iotop doesn't work on (NAND) mtd devices, is there a tool, or an API
>>> to query the number of read or written bytes per mtd?
>>
>> For the record: switching on all the needed kernel config options as
>> stated in the iotop manpage helps a lot.
>
> Update:
>
> The kernel makes the information available at /proc/$$/io. However
> "read_bytes" and "write_bytes" seems not to be accurate for mtd devices.
>
> Poking around a bit in the kernel code makes me wonder if some
> task_io_account_read(), task_io_account_write() at the right places
> would make the accounting better?

I'd guess so.
One thing we need to consider are stacked MTDs, here the accounting
should not happen multiple times.
