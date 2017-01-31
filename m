Received: from b.ns.miles-group.at ([95.130.255.144] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.87 #1 (Red Hat Linux))
 id 1cYTxb-0000oe-ML
 for linux-mtd@lists.infradead.org; Tue, 31 Jan 2017 08:38:45 +0000
Subject: Re: UBI/UBIFS corruptions during random power-cuts
To: Bhuvanchandra DV <bhuvanchandra.dv@toradex.com>,
 linux-mtd@lists.infradead.org
References: <b5608215-347a-f9a0-aa71-33546d7eab1b@toradex.com>
 <0500de05-b3d7-6cbc-0236-5d4c83a5f00f@nod.at>
 <961abad6-7d46-4427-fb2b-97477a4a6a10@toradex.com>
 <2be57b2b-8fad-a987-8257-18f8ea024621@nod.at>
 <89cd8327-581b-4285-d9ae-138d800211cf@toradex.com>
 <bceb976b-0aac-fe04-a540-f24823366233@nod.at>
 <c5cc6f86-fb4e-cdb4-8b0b-10d4dfd33735@toradex.com>
 <5a769de2-31f1-f011-c6bc-e94427407751@nod.at>
 <a27bc761-b8d2-4f69-468a-b9a4d61c68f8@toradex.com>
 <306876cd-0855-b9ee-659d-2164cfc3b2c4@nod.at>
 <877dea3c-717d-9b1a-c01d-537f3b46b2de@toradex.com>
 <ff60b696-ffec-8ddd-16bd-407a9bacb3e0@nod.at>
 <47db4d54-f8f5-a663-75b3-d2cd5fd0769f@toradex.com>
 <c3c9dcff-5738-d36c-189d-8aa0e9be98ca@nod.at>
 <763b493b-1ff5-0e7e-7376-a6f4edd1d38f@toradex.com>
 <d69b2e1a-9ccf-9657-e3a5-769d244fbb8f@nod.at>
 <d8159144-0ccb-5043-2cb7-48dfe8b94fad@toradex.com>
Cc: Artem Bityutskiy <dedekind1@gmail.com>
From: Richard Weinberger <richard@nod.at>
Message-ID: <37a60a78-4a90-0b53-366e-1f5ba68c43e8@nod.at>
Date: Tue, 31 Jan 2017 09:38:19 +0100
MIME-Version: 1.0
In-Reply-To: <d8159144-0ccb-5043-2cb7-48dfe8b94fad@toradex.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Bhuvan,

Am 31.01.2017 um 09:31 schrieb Bhuvanchandra DV:
>> Is this really the last triggered warning right before the power-cut where UBIFS renders unmountable?
>> I miss the failing ubifs_assert().
> 
> No this not the one before corruption, observed this on every power cut thought this is what you are expecting.
> Let me continue the power-cut tests until the ubifs getting corrupted for the expected ubids_assert logs.

Thanks! sorry for not being clear at first place.

Thanks,
//richard
