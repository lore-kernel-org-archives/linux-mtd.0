Received: from mail-we0-x236.google.com ([2a00:1450:400c:c03::236])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UCp2h-0003wt-Hk
 for linux-mtd@lists.infradead.org; Tue, 05 Mar 2013 10:24:20 +0000
Received: by mail-we0-f182.google.com with SMTP id t57so5950515wey.13
 for <linux-mtd@lists.infradead.org>; Tue, 05 Mar 2013 02:24:14 -0800 (PST)
Message-ID: <5135C7D0.8010906@gmail.com>
Date: Tue, 05 Mar 2013 11:24:16 +0100
From: Daniel Mack <zonque@gmail.com>
MIME-Version: 1.0
To: Peter Korsgaard <jacmet@sunsite.dk>
Subject: Re: [PATCH v2] mtd: devices: elm: check for device's presence before
 configuration
References: <1362355040-27344-1-git-send-email-zonque@gmail.com>
 <87r4jvehcs.fsf@dell.be.48ers.dk>
In-Reply-To: <87r4jvehcs.fsf@dell.be.48ers.dk>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: dwmw2@infradead.org, linux-mtd@lists.infradead.org,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04.03.2013 08:47, Peter Korsgaard wrote:
>>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
> 
>  Daniel> In case the driver is not probed - due to config mismatches or errors
>  Daniel> in the DTS files - dev_get_drvdata() returns NULL, leading to an Ooops
>  Daniel> during boot.
> 
>  Daniel> Make elm_config() return an error in such cases to propagate the error
>  Daniel> up to the user, so it can fall back to software mode.
> 
>  Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
>  Daniel> Cc: Philip Avinash <avinashphilip@ti.com>
>  Daniel> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>  Daniel> Cc: Peter Korsgaard <jacmet@sunsite.dk>
> 
> Acked-by: Peter Korsgaard <jacmet@sunsite.dk>

Philip, are you also ok with this?


Thanks,
Daniel
