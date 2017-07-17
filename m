Received: from mail-io0-x235.google.com ([2607:f8b0:4001:c06::235])
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1dX1kg-0004kF-Cq
 for linux-mtd@lists.infradead.org; Mon, 17 Jul 2017 08:51:39 +0000
Received: by mail-io0-x235.google.com with SMTP id r36so39604275ioi.1
 for <linux-mtd@lists.infradead.org>; Mon, 17 Jul 2017 01:51:17 -0700 (PDT)
Message-ID: <1500281422.8256.5.camel@gmail.com>
Subject: Re: [PATCH v3 03/10] mtd: powernv_flash: Don't treat OPAL_SUCCESS
 as an error
From: Balbir Singh <bsingharora@gmail.com>
To: Cyril Bur <cyrilbur@gmail.com>, linuxppc-dev@lists.ozlabs.org,
 linux-mtd@lists.infradead.org
Cc: stewart@linux.vnet.ibm.com, alistair@popple.id.au, dwmw2@infradead.org,
 rlippert@google.com
Date: Mon, 17 Jul 2017 18:50:22 +1000
In-Reply-To: <20170712042304.19745-4-cyrilbur@gmail.com>
References: <20170712042304.19745-1-cyrilbur@gmail.com>
 <20170712042304.19745-4-cyrilbur@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, 2017-07-12 at 14:22 +1000, Cyril Bur wrote:
> While this driver expects to interact asynchronously, OPAL is well
> within its rights to return OPAL_SUCCESS to indicate that the operation
> completed without the need for a callback. We shouldn't treat
> OPAL_SUCCESS as an error rather we should wrap up and return promptly to
> the caller.
> 
> Signed-off-by: Cyril Bur <cyrilbur@gmail.com>
> ---
> I'll note here that currently no OPAL exists that will return
> OPAL_SUCCESS so there isn't the possibility of a bug today.

It would help if you mentioned OPAL_SUCCESS to the async call. So effectively
what we expected to be an asynchronous call with callback, but OPAL returned
immediately with success.

Balbir Singh.
