MIME-Version: 1.0
In-Reply-To: <1432172966.27761.153.camel@freescale.com>
References: <1431420591-20453-1-git-send-email-r65777@rhuath.am.freescale.net>
 <1431438951.16357.490.camel@freescale.com>
 <20150519220124.GA11598@ld-irv-0074>
 <1432172966.27761.153.camel@freescale.com>
Date: Wed, 20 May 2015 19:00:44 -0700
Message-ID: <CAN8TOE-kDU9WaEWt0YstAyO35AzEnU_x5=bb5pb=Gh=6KWN7zA@mail.gmail.com>
Subject: Re: [PATCH 1/1] [RESEND] IFC: Change IO accessor based on endianness
From: Brian Norris <computersforpeace@gmail.com>
To: Scott Wood <scottwood@freescale.com>
Content-Type: text/plain; charset=UTF-8
Cc: Arnd Bergmann <arnd@arndb.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Bharat Bhushan <Bharat.Bhushan@freescale.com>, mailman@lists.infradead.org,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>,
 "prabhakar@freescale.com" <prabhakar@freescale.com>,
 Jaiprakash Singh <b44839@freescale.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

+ David

On Wed, May 20, 2015 at 6:49 PM, Scott Wood <scottwood@freescale.com> wrote:
> On Tue, 2015-05-19 at 15:01 -0700, Brian Norris wrote:
>> I haven't actually seen the patch on linux-mtd. Were we CC'd? If not,
>> please resend, and CC linux-mtd@lists.infradead.org. (Try
>> scripts/get_maintainer.pl to find the right people/lists.)
>
> linux-mtd@lists.infradead.org was in the To: header.
>
> One possible problem is that Bharat sent the patch with a bad
> (intranet) e-mail address (I've corrected in this e-mail); this may
> have gotten the patch spam filtered by the maillist server.  Bharat,
> please fix your git send-mail configuration (and don't use rhuath as a
> development machine).
>
> ...though, the previous postings were made by Jaiprakesh with a valid
> e-mail address, so maybe something else about the patch is hitting a
> filter.  CCing mailman@lists.infradead.org; can someone check logs to
> see if the list received these e-mails (e.g. v4 sent on December 8th by
> Jaiprakesh, message id
> <1418017580-2749-1-git-send-email-b44839@freescale.com>)?

I have admin access now, and this message doesn't show up in the 'Held
Mesages' view. It seems like the message never even made it to the
list. I'm a little unfamiliar with mailman, though, so I don't know if
there's a way to see a full log of received messages.

For Bharat's sake: if you're ever in doubt, you can double check the
MTD archives to make sure your messages got through:

http://lists.infradead.org/pipermail/linux-mtd/

>> And is this the previous version?
>>
>> http://lists.infradead.org/pipermail/linux-mtd/2014-November/056249.html
>
> It's a previous version, though the current version was previously sent
> as v4.

Well that's a bit confusing too. It'd be nice if we kept the version
numbering linear...

Brian
