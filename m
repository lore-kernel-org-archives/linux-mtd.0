Received: from mail-pa0-f47.google.com ([209.85.220.47])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UeJFj-0004mx-93
 for linux-mtd@lists.infradead.org; Mon, 20 May 2013 06:07:24 +0000
Received: by mail-pa0-f47.google.com with SMTP id kl13so5306450pab.6
 for <linux-mtd@lists.infradead.org>; Sun, 19 May 2013 23:06:53 -0700 (PDT)
Message-ID: <5199BD45.5090100@gmail.com>
Date: Sun, 19 May 2013 23:05:57 -0700
From: Brian Norris <computersforpeace@gmail.com>
MIME-Version: 1.0
To: Huang Shijie <b32955@freescale.com>, vikram186@gmail.com
Subject: Re: [PATCH v6 05/10 fix] mtd: get the ECC info from the Extended
 Parameter Page
References: <51966AA7.7050007@gmail.com>
 <1369015705-4720-1-git-send-email-b32955@freescale.com>
In-Reply-To: <1369015705-4720-1-git-send-email-b32955@freescale.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-kernel@vger.kernel.org, dedekind1@gmail.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Huang, Vikram,

On 05/19/2013 07:08 PM, Huang Shijie wrote:
...
> +	/*
> +	 * From section 5.7.2.2, we know that the Extened Param Page is valid
> +	 * when two or more bytes of the signatrue are valid.

s/signatrue/signature

> +	 * So we only check the first two bytes here.
> +	 */
> +	if (strncmp(ep->sig, "EP", 2)) {
> +		pr_debug("The signatrue is invalid.\n");

Ditto.

> +		goto ext_out;
> +	}

What's the reasoning about this whole "only check 2 bytes" thing? I 
understand that this is technically what spec *says* (although you're 
actually not checking the other 5 combinations that are valid: 'ExPx' 
'ExxS' 'xPPx' 'xPxS' 'xxPS'). But *why* does the spec say this? To 
tolerate errors or to tolerate changes in the spec (e.g., new types of 
parameter pages that say 'QPPS' [1], for instance)? The former doesn't 
really sound plausible, since if we're going to have 2 whole bytes of 
errors in the signature, then we really shouldn't trust the whole 
(extended) parameter page. And the latter doesn't really make sense to 
me; any future backwards-compatible modifications should just use the 
same signature string.

Anyway, my point is that there has to be some logic to strictly 
following the letter of the specification. Shortening the check to just 
the 2-byte "EP" string does not actually cover *exactly* what the spec 
might allow (e.g., it doesn't allow "QPPS" [1]). But it also doesn't 
make any sense why we want to check anything besides "EPPS". So my 
natural inclination is to be strict in what we accept (i.e., exactly the 
"EPPS" string) until we find a reason otherwise.

Or, if you're gonna pull the strict compliance card, check all 6 
combinations, not just 1 of them.

Brian

[1] This is a totally made-up example. I do not understand at all why 
ONFI would allow anything besides exactly "EPPS".
