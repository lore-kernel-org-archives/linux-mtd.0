Received: from smtp1-g21.free.fr ([2a01:e0c:1:1599::10])
 by merlin.infradead.org with esmtp (Exim 4.76 #1 (Red Hat Linux))
 id 1SAS51-0004E9-Dm
 for linux-mtd@lists.infradead.org; Wed, 21 Mar 2012 20:24:24 +0000
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: dedekind1@gmail.com
Subject: Re: [PATCH 4/4] drivers/mtd: docg3 add protection against concurrency
References: <1332196342-21545-1-git-send-email-robert.jarzmik@free.fr>
 <1332196342-21545-5-git-send-email-robert.jarzmik@free.fr>
 <1332243749.11468.21.camel@sauron.fi.intel.com>
Date: Wed, 21 Mar 2012 21:24:14 +0100
In-Reply-To: <1332243749.11468.21.camel@sauron.fi.intel.com> (Artem
 Bityutskiy's message of "Tue, 20 Mar 2012 13:42:29 +0200")
Message-ID: <87iphx8zyp.fsf@free.fr>
MIME-Version: 1.0
Content-Type: text/plain
Cc: linux-mtd@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Artem Bityutskiy <dedekind1@gmail.com> writes:

> On Mon, 2012-03-19 at 23:32 +0100, Robert Jarzmik wrote:
>> +static void cascade_lock(struct docg3 *docg3)
>> +{
>> +	mutex_lock(&docg3->cascade->lock);
>> +}
>> +
>> +static void cascade_unlock(struct docg3 *docg3)
>> +{
>> +	mutex_unlock(&docg3->cascade->lock);
>> +}
>
> Please, do not introduce that trivial wrappers - they are useless and
> only hurt readability. Open-coded mutex_lock()/mutex_unlock() is more
> readable.
OK for V2.

I'll await comments for 3 or 4 days before releasing V2.

Cheers.

-- 
Robert
