Received: from smtp.newsguy.com ([74.209.136.69])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1SOwgu-0005ij-0H
 for linux-mtd@lists.infradead.org; Mon, 30 Apr 2012 19:55:24 +0000
Message-ID: <4F9EEE26.9040806@newsguy.com>
Date: Mon, 30 Apr 2012 12:55:18 -0700
From: Mike Dunn <mikedunn@newsguy.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind1@gmail.com>
Subject: Re: [PATCH 7/7] mtd: driver _read() returns max_bitflips; mtd_read()
 returns -EUCLEAN
References: <1335295105-7981-1-git-send-email-mikedunn@newsguy.com>
 <1335295105-7981-8-git-send-email-mikedunn@newsguy.com>
 <871unbis55.fsf@free.fr> <4F984CC9.9060701@newsguy.com>
 <1335727480.1942.18.camel@koala>
In-Reply-To: <1335727480.1942.18.camel@koala>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Cc: linux-mtd@lists.infradead.org, Robert Jarzmik <robert.jarzmik@free.fr>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On 04/29/2012 12:24 PM, Artem Bityutskiy wrote:
> On Wed, 2012-04-25 at 12:13 -0700, Mike Dunn wrote:
>> Thanks for the review Robert.
>>
>> On 04/25/2012 11:27 AM, Robert Jarzmik wrote:
>>>
>>> I think you should change :
>>>> - 	while (!ret && (len > 0 || ooblen > 0)) {" will exit because ret is not
>>> into
>>>> - 	while (ret >= 0 && (len > 0 || ooblen > 0)) {".
>>>
>>> With that change, please add my:
>>> Acked-by: Robert Jarzmik <robert.jarzmik@free.fr>
>>
>>
>> In my exuberance, I prematurely sent the next version of the whole set.  Artem,
>> Robert's requested change is in patch 7/7.  If no other problems come to light,
>> maybe you could consider merging the first 6?  Then I only need to prepare a
>> corrected version of patch 7.
> 
> Pushed the series to l2-mtd.git, thanks! You can send the newer version
> and I'll put it instead of the older one. Do not forget to add
> Acked-by's when you re-send, please.
> 


Thanks Artem.  Since you merged all 7, the only thing remaining is the fix to
docg3 that Robert describes above.  Robert, if you would rather prepare that
patch, I defer to you.  Otherwise, I'll submit it no later than tomorrow.

Yeah, sorry Artem, I neglected to add the Acked-by's in the patches you just merged.

Mike
