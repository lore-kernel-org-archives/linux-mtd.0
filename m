Received: from mail-bw0-f219.google.com ([209.85.218.219])
	by bombadil.infradead.org with esmtp (Exim 4.69 #1 (Red Hat Linux))
	id 1MTVzn-0003EU-OB
	for linux-mtd@lists.infradead.org; Wed, 22 Jul 2009 07:12:15 +0000
Received: by bwz19 with SMTP id 19so3076862bwz.18
	for <linux-mtd@lists.infradead.org>;
	Wed, 22 Jul 2009 00:12:10 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <4A66B547.6020207@nokia.com>
References: <531B6536C9F737458807DF75064873C8303DD7D768@mta-digimail.MTA.INT>
	<4A66B547.6020207@nokia.com>
Date: Wed, 22 Jul 2009 09:12:08 +0200
Message-ID: <71cd59b00907220012pe8200e6od143f2561501bd0f@mail.gmail.com>
Subject: Re: UBI FS mounting time
From: Corentin Chary <corentin.chary@gmail.com>
To: Adrian Hunter <adrian.hunter@nokia.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
	Bosi Daniele <Daniele.Bosi@mta.it>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Wed, Jul 22, 2009 at 8:44 AM, Adrian Hunter<adrian.hunter@nokia.com> wrote:
> Bosi Daniele wrote:
>>
>> We have a UBI+UBIFS 1GB partition on a NAND chip, which takes around 6s to
>> mount.
>>
>> We'd like to have the data available at least read-only earlier than that.
>>
>> We know UBI on principle needs to read the map of all blocks in order to
>> rebuild the logical view of the memory, but maybe there's another way around
>> it to make it available earlier...
>>
>> Someone know how?
>
> Some options are:
>
>
> a) Use another smaller partition that can mount first and provide some
> functionality while the larger partition mounts.
> b) Reduce the number of eraseblocks by combining them into larger logical
> blocks.
> c) Change UBI to write its mapping table when it is unloaded, so it can be
> read quickly when loading (still have to scan if UBI was not unloaded
> cleanly).

Do you know if someone is trying to implement that ?
I did some test, and using lzo/zlib it should be possible to store
such a mapping
store in only one PEB.
Then we can choose this PEB to be near the beginning of the
flash to speed up scanning (using ec and pnum to calculate a "score").
This is also possible to use an "anchor".




-- 
Corentin Chary
http://xf.iksaif.net - http://uffs.org
