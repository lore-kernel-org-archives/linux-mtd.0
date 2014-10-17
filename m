Received: from mail-lb0-x22c.google.com ([2a00:1450:4010:c04::22c])
 by bombadil.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1XfAVa-00052E-CD
 for linux-mtd@lists.infradead.org; Fri, 17 Oct 2014 16:36:07 +0000
Received: by mail-lb0-f172.google.com with SMTP id b6so987798lbj.17
 for <linux-mtd@lists.infradead.org>; Fri, 17 Oct 2014 09:35:42 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20141015230434.GZ1193@ld-irv-0074>
References: <1407713341-4446-1-git-send-email-akinobu.mita@gmail.com>
 <1413208135.7906.24.camel@sauron.fi.intel.com>
 <1413214845.7906.53.camel@sauron.fi.intel.com>
 <20141015230434.GZ1193@ld-irv-0074>
Date: Sat, 18 Oct 2014 01:35:42 +0900
Message-ID: <CAC5umyij_v55TDKkz-_JL+BUqc9rRh8ugOwfhdy5Fo1AEaRD0w@mail.gmail.com>
Subject: Re: [PATCH] nandsim: add id_bytes module parameter
From: Akinobu Mita <akinobu.mita@gmail.com>
To: Brian Norris <computersforpeace@gmail.com>
Content-Type: text/plain; charset=UTF-8
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 David Woodhouse <dwmw2@infradead.org>, Artem Bityutskiy <dedekind1@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

2014-10-16 8:04 GMT+09:00 Brian Norris <computersforpeace@gmail.com>:
> On Mon, Oct 13, 2014 at 06:40:45PM +0300, Artem Bityutskiy wrote:
>> On Mon, 2014-10-13 at 16:48 +0300, Artem Bityutskiy wrote:
>> > On Mon, 2014-08-11 at 08:29 +0900, Akinobu Mita wrote:
>> > > nandsim can simulate NAND Flash which returns the ID bytes specified
>> > > by first_id_byte, ..., fourth_id_byte module parameters.
>> > >
>> > > In order to simulate NAND flash which returns more than four ID bytes,
>> > > this adds id_bytes module parameter which is specified by the array of
>> > > byte like this:
>> > >
>> > >  # modprobe nandsim id_bytes=0x98,0xdc,0x90,0x26,0x76,0x15,0x01,0x08 bch=1
>> > >
>> > > This doesn't add fifth_id_byte, ..., seventh_id_byte module parameters,
>> > > becuase they are redundant.  But the existing first_id_byte, ...,
>> > > fourth_id_byte module parameters are preserved.
>> >
>> > Hi, I missed this patch, sorry. It looks good to me, I'll take it to my
>> > tree.
>>
>> Actually, let's merge this via the l2-mtd.git tree. Brian, what do you
>> think about this patch? It looks good for me in general, but I did not
>> review it line-by-line. The only thing is that the 'modinfo nandsim' may
>> look confusing for the user, who sees so many ID-related parameters, so
>> I'd add an "(obsolete)" marker to the string describing the old
>> parameters. But this is a minor thing, I did not want to ask Akinobu
>> about this because the patch was already waiting for very long time, I'd
>> do this myself while merging.
>
> Sorry, I really don't have the time to review every single patch these
> days. I had briefly looked at this patch previously and thought it was a
> good idea, but like you, I didn't look through all the code.
>
> I'll try to queue this up after the merge window, unless I discover
> something that really must be improved.

Thanks for considering this patch.

After reading this again, I realized that module_param_named() should
be used instead of module_param_cb() for existing parameters.  So I'll
send updated patch with adding "(obsolete)" to module description as
Artem suggested.
