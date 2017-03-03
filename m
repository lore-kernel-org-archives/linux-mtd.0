Received: from mail.free-electrons.com ([62.4.15.54])
 by bombadil.infradead.org with esmtp (Exim 4.87 #1 (Red Hat Linux))
 id 1cjmPx-0001h0-G2
 for linux-mtd@lists.infradead.org; Fri, 03 Mar 2017 12:34:43 +0000
Date: Fri, 3 Mar 2017 13:34:19 +0100
From: Boris Brezillon <boris.brezillon@free-electrons.com>
To: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
Cc: Alban <albeu@free.fr>, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mtd@lists.infradead.org, Cyrille Pitchen
 <cyrille.pitchen@atmel.com>, Richard Weinberger <richard@nod.at>, Marek
 Vasut <marek.vasut@gmail.com>, Brian Norris <computersforpeace@gmail.com>,
 David Woodhouse <dwmw2@infradead.org>, Mark Rutland <mark.rutland@arm.com>,
 Rob Herring <robh+dt@kernel.org>, Maxime Ripard
 <maxime.ripard@free-electrons.com>, Moritz Fischer
 <moritz.fischer@ettus.com>
Subject: Re: [PATCH 2/3] mtd: Add support for reading MTD devices via the
 nvmem API
Message-ID: <20170303133419.2383dbce@bbrezillon>
In-Reply-To: <b2df74bb-dd86-bac1-ab8b-cbff6ca29b6f@linaro.org>
References: <1488484223-844-1-git-send-email-albeu@free.fr>
 <1488484223-844-3-git-send-email-albeu@free.fr>
 <b2df74bb-dd86-bac1-ab8b-cbff6ca29b6f@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, 3 Mar 2017 11:23:16 +0000
Srinivas Kandagatla <srinivas.kandagatla@linaro.org> wrote:


> 
> > +	mutex_lock(&mtd_nvmem_list_lock);
> > +	list_for_each_entry(mtd_nvmem, &mtd_nvmem_list, list) {
> > +		if (mtd_nvmem->mtd == mtd) {
> > +			list_del(&mtd_nvmem->list);
> > +			found = true;
> > +			break;
> > +		}
> > +	}
> > +	mutex_unlock(&mtd_nvmem_list_lock);
> > +
> > +	if (found) {
> > +		if (nvmem_unregister(mtd_nvmem->nvmem))
> > +			dev_err(&mtd->dev,
> > +				"Failed to unregister NVMEM device\n");  
> 
> I will be nice to feedback error to top layer, as it does not make sense 
> to remove providers if there are active consumers using it.
> 
> del_mtd_device(), unregister_mtd_user() have return values, I see no 
> reason why notifiers  should not return errors.
> May be if we should fix the remove() call backs to handle and return errors.

It's more complicated than that. What should you do if one of the
->remove() notifier in the middle of the list is returning an error?
Some of them have already taken the remove notification into account.
Should we call ->add() back on those notifiers? Also, I'm not sure they
are all safe against double ->remove() calls, so if we might be in
trouble when the removal is retried.
