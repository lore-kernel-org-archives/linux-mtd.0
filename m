Message-ID: <4B0FD7D9.5060904@nokia.com>
Date: Fri, 27 Nov 2009 15:44:57 +0200
From: Adrian Hunter <adrian.hunter@nokia.com>
MIME-Version: 1.0
To: Artem Bityutskiy <dedekind@infradead.org>
Subject: Re: UBIFS synchronisation questions about file create/delete
References: <001301ca6edc$5fc49660$1f4dc320$@dierckx@telenet.be>
	<4B0F8B78.5080405@nokia.com>
	<000001ca6f65$4752a8e0$d5f7faa0$@dierckx@telenet.be>
In-Reply-To: <000001ca6f65$4752a8e0$d5f7faa0$@dierckx@telenet.be>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Cc: Ronny Dierckx <ronny.dierckx@telenet.be>,
	"linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	"Bityutskiy Artem \(Nokia-M/Helsinki\)" <Artem.Bityutskiy@nokia.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Ronny Dierckx wrote:
>> No it is not normal behaviour.
>>
>> 10 minutes is long enough for everything to be written and flushed.  The
> file
>> should be completely intact.
>>
>> No UBIFS operations which change directory entries are not entirely
>> synchronous.  There is a NAND-page-sized buffer which must be flushed.
>> It is flushed every 5 seconds or so.  Otherwise you must do some kind of
>> sync.
>>
>> I can only guess that that version of UBIFS is somehow broken.
> 
> Hi Adrian,
> 
> I tried some different versions from
> git://git.infradead.org/~dedekind/ubifs-v2.6.27.git
> and the problem is caused by commit " UBIFS: fix 64-bit divisions in debug
> print " 
> 9d016dc4b3006ef3493b21442394028614e26da5 :
> 
> dbg_io("set timer for jhead %d, %llu millisecs", wbuf->jhead,
> -       ktime_to_ns(wbuf->hardlimit)/USEC_PER_SEC);
> -       hrtimer_start(&wbuf->timer, wbuf->hardlimit, HRTIMER_MODE_REL);
> +       div_u64(ktime_to_ns(wbuf->hardlimit), USEC_PER_SEC)); 
> }
> 
> As you can see the timer is no longer started. Could you please fix this ?

It is Artem's git tree.

Artem, can you look at this?
