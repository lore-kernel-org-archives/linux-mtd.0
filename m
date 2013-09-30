Received: from vv.carleton.ca ([134.117.143.143])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1VQT7b-0007Ke-Kc
 for linux-mtd@lists.infradead.org; Mon, 30 Sep 2013 02:22:03 +0000
Received: from mail-wg0-f41.google.com (mail-wg0-f41.google.com [74.125.82.41])
 (authenticated bits=0)
 by vv.carleton.ca (8.14.4/8.14.4) with ESMTP id r8U2Lfcj014032
 (version=TLSv1/SSLv3 cipher=RC4-SHA bits=128 verify=OK)
 for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2013 22:21:42 -0400
Received: by mail-wg0-f41.google.com with SMTP id l18so2871052wgh.2
 for <linux-mtd@lists.infradead.org>; Sun, 29 Sep 2013 19:21:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAE2LqHKQGfR7JwKP43OXARcrX5-RS3Y8SVT5TZgO3+PBOR9X9w@mail.gmail.com>
References: <CAE2LqHKQGfR7JwKP43OXARcrX5-RS3Y8SVT5TZgO3+PBOR9X9w@mail.gmail.com>
Date: Sun, 29 Sep 2013 22:21:40 -0400
Message-ID: <CAE2LqHJ+sUoozi-Macd3TN66wCym_rmq4yNapBuiWhfQeni5jA@mail.gmail.com>
Subject: Re: Race between mtdconcat and rootfs detection?
From: Catalin Patulea <cat@vv.carleton.ca>
To: linux-mtd@lists.infradead.org
Content-Type: text/plain; charset=ISO-8859-1
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Sep 29, 2013 at 9:21 PM, Catalin Patulea <cat@vv.carleton.ca> wrote:
> 3) async_schedule(&call_mtd_device_register): This is a potential fix
> because prepare_namespace does async_synchronize_full [1]. But
> mtd_device_register -> parse_mtd_partitions -> request_module, which
> is disallowed in async.
I think I fixed this by calling mtd_device_parse_register directly
with an empty parser list, so it doesn't try to load modules.
