Received: from mail-wg0-x22f.google.com ([2a00:1450:400c:c00::22f])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WxDdK-0008R0-TK
 for linux-mtd@lists.infradead.org; Wed, 18 Jun 2014 11:02:27 +0000
Received: by mail-wg0-f47.google.com with SMTP id k14so653634wgh.30
 for <linux-mtd@lists.infradead.org>; Wed, 18 Jun 2014 04:02:03 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <53A16066.4040805@codeaurora.org>
References: <20140618044434.GA9331@gmail.com> <53A16066.4040805@codeaurora.org>
Date: Wed, 18 Jun 2014 21:02:03 +1000
Message-ID: <CAKZMjSvceerbBqN6-jcBvbinJB5GdZpJSB-Bqg1ofMYN7pQqew@mail.gmail.com>
Subject: Re: UBIFS becomes read-only when written, then fails to mount
From: Matt Hevern <matt.hevern@gmail.com>
To: Tanya Brokhman <tlinder@codeaurora.org>
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

>>   ubiblke: unknown partition table
>> ....
>
>
> How did you create your ubifs and ubi images?


I used the following commands:

mkfs.ubifs -x "none" -m 2048 -r config -e 126976  -c 256 -o config.ubifs
then
ubinize -o system.ubi -s 2048 -m 2048 -p "128 KiB" system.ini

----system.ini
4 other volumes here

[config]
mode=ubi
image=config.ubifs
vol_id=5
vol_type=dynamic
vol_size=20MiB
vol_name=config
vol_alignment=1
vol_flags=autoresize
----

Then this is written using ubiformat.


Matt
