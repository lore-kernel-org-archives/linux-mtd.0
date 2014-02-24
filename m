Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1WHxaf-0000NH-R5
 for linux-mtd@lists.infradead.org; Mon, 24 Feb 2014 15:37:11 +0000
Message-ID: <530B670B.3090002@nod.at>
Date: Mon, 24 Feb 2014 16:36:43 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Bill Pringlemeir <bpringlemeir@nbsps.com>
Subject: Re: UBI leb_write_unlock NULL pointer Oops (continuation)
References: <D7B1B5F4F3F27A4CB073BF422331203F2A18997F1F@Exchange1.lawo.de>	<CAFLxGvya5WXoKcYmOgeM_SmVVEht1jEzeLG9vHhwFudFU+Ny8A@mail.gmail.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A18997F8B@Exchange1.lawo.de>	<52EF772D.8080207@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A18DD7989@Exchange1.lawo.de>	<52EF9FFE.4020405@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A18A7474A@Exchange1.lawo.de>	<52F1F658.9080701@nod.at>	<D7B1B5F4F3F27A4CB073BF422331203F2A1ECCF6AE@Exchange1.lawo.de>	<87zjlxy8lj.fsf@nbsps.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A1ECCFB51@Exchange1.lawo.de>	<87txc4w698.fsf@nbsps.com>	<D7B1B5F4F3F27A4CB073BF422331203F2A250B53F4@Exchange1.lawo.de>	<D7B1B5F4F3F27A4CB073BF422331203F2A250B54E6@Exchange1.lawo.de>	<877g8ojqsn.fsf@nbsps.com>
 <53079725.6080105@nod.at>	<87ios8gsho.fsf@nbsps.com>
 <87k3coq8di.fsf@nbsps.com>	<530860B1.9000808@nod.at>
 <877g8kr1h7.fsf@nbsps.com>
In-Reply-To: <877g8kr1h7.fsf@nbsps.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "Wiedemer, Thorsten \(Lawo AG\)" <Thorsten.Wiedemer@lawo.com>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Am 24.02.2014 16:09, schrieb Bill Pringlemeir:
> On 22 Feb 2014, richard@nod.at wrote:
> 
>> Am 22.02.2014 01:49, schrieb Bill Pringlemeir:
> 
>>> I think the 'ubi_eba_copy_leb()' may have an issue.
>>>
>>> int ubi_eba_copy_leb(struct ubi_device *ubi, int from, int to,
>>> 		     struct ubi_vid_hdr *vid_hdr)
>>> {
>>> ...
>>>
>>> 	err = leb_write_trylock(ubi, vol_id, lnum);
>>>
>>> static int leb_write_trylock(struct ubi_device *ubi, int vol_id, int lnum)
>>> {
>>> ..
>>> 	le = ltree_add_entry(ubi, vol_id, lnum);  /* users + 1 */
>>> 	if (IS_ERR(le))
>>> 		return PTR_ERR(le);
>>> 	if (down_write_trylock(&le->mutex))
>>> 		return 0;
>>>
>>> 	/* Contention, cancel */
>>> 	spin_lock(&ubi->ltree_lock);
>>> 	le->users -= 1;                           /* user - 1 */
>>> ...
>>> 	spin_unlock(&ubi->ltree_lock);           
>>>
>>> 	return 1;
>>> }
>>>
>>> 	if (err)...
>>>
> 	if (vol->eba_tbl[lnum] != from) {
> 		dbg_wl("LEB %d:%d is no longer mapped to PEB %d, mapped to PEB %d, cancel",
> 		       vol_id, lnum, from, vol->eba_tbl[lnum]);
> 		err = MOVE_CANCEL_RACE;
> 		goto out_unlock_leb;
> 	}
> ...
> out_unlock_leb:
> 	leb_write_unlock(ubi, vol_id, lnum);     /* user - 1 */
> 
> 
>>> Didn't the count have to bump up in this case?  This isn't in Thorsten's
>>> traces, but neither are any 'down_read' or 'up_read' traces; maybe
>>> everything is in cache?
> 
>> Hmm, I'm not sure whether I was able to follow your thought.  But
>> leb_write_unlock() is balanced with leb_write_trylock() in
>> ubi_eba_copy_leb() which makes perfectly sense to me.  What exactly is
>> the problem?
> 
> There are two things that must be balanced.  The 'reference count'
> ubi_ltree_entry -> users and the rw_semaphore down/up.  You are right,
> the trylock needs to be balanced by the 'leb_write_unlock'.  However,
> the 'leb_write_trylock()' has already decremented 'users' in preperation
> to move the 'lnum'.  However, in the case of contention,
> 'ubi_eba_copy_leb' bails and does the 'leb_write_unlock()', which
> balances the 'trylock', but unbalances the 'users' reference count (I
> added some comments on the lines).

My first thought here is "If this is true, why does ubi_assert(le->users >= 0) not trigger"?

Thanks,
//richard
