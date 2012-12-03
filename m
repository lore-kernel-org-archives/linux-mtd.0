Received: from mail-ie0-f177.google.com ([209.85.223.177])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1TfVvX-0004rW-1d
 for linux-mtd@lists.infradead.org; Mon, 03 Dec 2012 13:19:15 +0000
Received: by mail-ie0-f177.google.com with SMTP id k13so3979592iea.36
 for <linux-mtd@lists.infradead.org>; Mon, 03 Dec 2012 05:19:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1354540234.11583.5.camel@sauron.fi.intel.com>
References: <1353808304-2538-1-git-send-email-elezegarcia@gmail.com>
 <1354540234.11583.5.camel@sauron.fi.intel.com>
Date: Mon, 3 Dec 2012 10:19:13 -0300
Message-ID: <CALF0-+X30T2GfveAHDUMsRYAo1e4WABx-2YgbcxgNYeR68MeJw@mail.gmail.com>
Subject: Re: [PATCH] nandsim: Introduce debugfs infrastructure
From: Ezequiel Garcia <elezegarcia@gmail.com>
To: dedekind1@gmail.com
Content-Type: text/plain; charset=ISO-8859-1
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Mon, Dec 3, 2012 at 10:10 AM, Artem Bityutskiy <dedekind1@gmail.com> wrote:
> On Sat, 2012-11-24 at 22:51 -0300, Ezequiel Garcia wrote:
>> It's more user friendly to report debug information and statistics
>> through debugfs, than to use printing facilites.
>>
>> This patch introduces a very minimal debugfs infrastructure
>> and moves eraseblock wear report to an entry located at:
>>
>> /sys/kernel/debug/nandsim/wear_report
>>
>> This means we can remove rptwear option and just let
>> the user read the wear report when we needs to.
>>
>> Cc: Artem Bityutskiy <dedekind1@gmail.com>
>> Signed-off-by: Ezequiel Garcia <elezegarcia@gmail.com>
>
> Looks good but would you please refactor it to get rid of the following
> warnings identified by aiaiai:
>

Oops, sorry. I'll send a v2 right away.

Thanks,

    Ezequiel
