Received: from wf-out-1314.google.com ([209.85.200.173])
	by bombadil.infradead.org with esmtp (Exim 4.68 #1 (Red Hat Linux))
	id 1L4yI8-0003Zq-NQ
	for linux-mtd@lists.infradead.org; Tue, 25 Nov 2008 13:49:25 +0000
Received: by wf-out-1314.google.com with SMTP id 28so2685253wfc.24
	for <linux-mtd@lists.infradead.org>;
	Tue, 25 Nov 2008 05:49:23 -0800 (PST)
Message-ID: <71cd59b00811250549p2581c25jf3bd34b14778d351@mail.gmail.com>
Date: Tue, 25 Nov 2008 14:49:23 +0100
From: "Corentin Chary" <corentin.chary@gmail.com>
To: "Liu Hui" <onlyflyer@gmail.com>
Subject: Re: [UBI] UFFS : Unified Flash File System
In-Reply-To: <52e42efe0811250514u6f12f7e1nef0837ef04376562@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <52e42efe0811240928g6bc4c8a6rd7483289f0ae83a2@mail.gmail.com>
	<2c3b11250811241730j17c97df4mb3073acfcf48bb6f@mail.gmail.com>
	<52e42efe0811250514u6f12f7e1nef0837ef04376562@mail.gmail.com>
Cc: eip@iksaif.net, linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Nov 25, 2008 at 2:14 PM, Sidney Amani <seed95@gmail.com> wrote:
> ---------- Forwarded message ----------
> From: Liu Hui <onlyflyer@gmail.com>
> Date: Tue, Nov 25, 2008 at 2:30 AM
> Subject: Re: [UBI] UFFS : Unified Flash File System
> To: Sidney Amani <seed95@gmail.com>
> Cc: linux-mtd@lists.infradead.org
>

Hope I'm not messing with the mailing list as I reply to a forwarded message.

> This is interesting. I have some questions about UFFS:
> 1)UFFS can work both with bare flash(MTD or UBI) and FTL(as a block
> device), how do you organize the metadata of UFFS(log-structured?).

I think it'll be log-structured, but we haven't yet finalized the
"on-flash" format.
We will work on that for the next few month.
Public website/mailing-list/svn will be created soon.

> 2)As we know, bare flash and FTL provide very different interfaces for
> FS. For MTD, FS should do garbage collection, wear leveling, bad block
> management by itself; For UBI, FS should also do garbage collection
> and wear leveling; and for FTL, FS just treat flash as block device.
> What will UFFS do to treat all of kind of interfaces? Will UFFS
> provide different strategy for different interfaces?

On linux, we will always use UBI for bare flash.
On WinCE or other OS where we can find MTD-like drivers (or just a
stupid simple flash driver) we will implement a UBI-like layer.
On FTL, we will try to implement a layer wich will be a kind of "UBI
for flash device with FTL": no garbage collection, but wear leveling
(for dumb ftl), REQ_FORGET, etc ...
