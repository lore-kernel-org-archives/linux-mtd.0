Received: from beaver.sibername.com ([64.15.155.210])
	by bombadil.infradead.org with esmtps (Exim 4.68 #1 (Red Hat Linux))
	id 1JH5GB-0008Or-GO
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2008 22:37:01 +0000
Received: from ottgate.precidia.com ([206.191.32.162]:51662
	helo=haven.ott.precidia.com)
	by beaver.sibername.com with esmtpa (Exim 4.68)
	(envelope-from <thraxisp@logicaloutcome.ca>) id 1JH5G7-0006zh-Ob
	for linux-mtd@lists.infradead.org; Mon, 21 Jan 2008 17:36:51 -0500
Message-Id: <527F0DC6-BB5F-4C38-94D5-FCC97A8F2FF2@logicaloutcome.ca>
From: Glenn Henshaw <thraxisp@logicaloutcome.ca>
To: linux-mtd@lists.infradead.org
In-Reply-To: <20080121212555.GA14472@lazybastard.org>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed; delsp=yes
Content-Transfer-Encoding: quoted-printable
Mime-Version: 1.0 (Apple Message framework v915)
Subject: Re: Jffs2 and big file = very slow jffs2_garbage_collect_pass
Date: Mon, 21 Jan 2008 17:36:45 -0500
References: <478F7E6D.8010300@parrot.com>
	<20080117162601.GA6677@lazybastard.org>
	<20080117114353.0bc71dac@zod.rchland.ibm.com>
	<479073D1.5010406@parrot.com>
	<20080118064852.026b0c82@zod.rchland.ibm.com>
	<4790D11E.6060201@parrot.com>
	<20080118115531.2deef9fb@zod.rchland.ibm.com>
	<20080118181744.GA15039@lazybastard.org>
	<4794C107.7070600@parrot.com>
	<20080121212555.GA14472@lazybastard.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


On 21-Jan-08, at 4:25 PM, J=F6rn Engel wrote:

> On Mon, 21 January 2008 16:57:59 +0100, Matthieu CASTET wrote:
>>
>> What's the status of logfs on NAND ?
>>
>> Last time I check, it didn't manage badblock.
>
> Is that the only thing stopping you from using logfs?
>
> mklogfs handles bad blocks.  Blocks rotting during lifetime are =20
> handled
> half-heartedly.  If that is a real problem for you I wouldn't be
> surprised if you caught logfs on the wrong foot once or twice.
>
>

   Has it been ported to a 2.4 kernel? I can't upgrade due to the =20
amount of work necessary to rewrite drivers.

--=20
Glenn Henshaw                     Logical Outcome Ltd.
e: thraxisp@logicaloutcome.ca     w: www.logicaloutcome.ca
