Received: from a.ns.miles-group.at ([95.130.255.143] helo=radon.swed.at)
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1YXZe5-0007xU-GO
 for linux-mtd@lists.infradead.org; Mon, 16 Mar 2015 18:21:46 +0000
Message-ID: <55071F1D.3040308@nod.at>
Date: Mon, 16 Mar 2015 19:21:17 +0100
From: Richard Weinberger <richard@nod.at>
MIME-Version: 1.0
To: Brian Norris <computersforpeace@gmail.com>
Subject: Re: [PATCH] UBI: fix missing brace control flow
References: <1424725642-26270-1-git-send-email-computersforpeace@gmail.com>
 <54EB99F1.4040608@nod.at> <20150316180844.GK32500@ld-irv-0074>
In-Reply-To: <20150316180844.GK32500@ld-irv-0074>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Dan Carpenter <dan.carpenter@oracle.com>,
 Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi!

Am 16.03.2015 um 19:08 schrieb Brian Norris:
> On Mon, Feb 23, 2015 at 10:21:53PM +0100, Richard Weinberger wrote:
>> Am 23.02.2015 um 22:07 schrieb Brian Norris:
>>> commit 0e707ae79ba3 ("UBI: do propagate positive error codes up") seems
>>> to have produced an unintended change in the control flow here.
>>>
>>> Completely untested, but it looks obvious.
>>>
>>> Caught by Coverity, which didn't like the indentation. CID 1271184.
>>>
>>> Signed-off-by: Brian Norris <computersforpeace@gmail.com>
>>> Cc: Dan Carpenter <dan.carpenter@oracle.com>
>>> ---
>>> Should go into 4.0, I expect.
>>
>> Good catch, patch tested and applied!
> 
> Is this going in 4.0? It fixes a typo in a hastily-applied patch that
> made it to 4.0-rc1.

That's the plan.

> I'm also not sure I understand the role of the +linux-next and +master
> branches in linux-ubifs.git. Typically 'next' means for the current+1
> release (i.e., 4.1), while 'not-next' (i.e., your master branch?) would
> be for the current release (4.0). But you have +master based on top of
> +linux-next.

I'm using Artem's scheme. next is the branch Linus pulls from.
Artem, why are the two UBIFS fixes from master not in next?
I thought you want to send a pull request to Linus?
If you want, I can do that. I'm anyway preparing some UBI fixes.

Thanks,
//richard
