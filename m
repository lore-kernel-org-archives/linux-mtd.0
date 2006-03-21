Received: from [84.204.75.166] (helo=shelob.oktetlabs.ru)
	by canuck.infradead.org with esmtps (Exim 4.54 #1 (Red Hat Linux))
	id 1FLitj-00036G-Mu
	for linux-mtd@lists.infradead.org; Tue, 21 Mar 2006 10:36:51 -0500
From: "Artem B. Bityutskiy" <dedekind@infradead.org>
To: "Belyakov, Alexander" <alexander.belyakov@intel.com>
In-Reply-To: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
References: <F048F58F304F0040BC3E937DE4E231E701D05FBF@NNSMSX401>
Content-Type: text/plain
Date: Tue, 21 Mar 2006 18:09:24 +0300
Message-Id: <1142953764.13740.0.camel@sauron.oktetlabs.ru>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Cc: "Korolev, Alexey" <alexey.korolev@intel.com>, linux-mtd@lists.infradead.org,
	"Kutergin, Timofey" <timofey.kutergin@intel.com>
Subject: Re: [PATCH/RFC] Linux MTD striping middle layer
Reply-To: dedekind@infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hello Alexander,

I have basic questions as I haven't grasped your concepts. Note, I'm not
an expert in RAID, so please, bother to explain basic notions as well.

Belyakov, Alexander wrote:
> In the suggested solution it is possible to stripe 2, 4, 8, etc.
devices
> of the same type. Note that devices with different sizes are
supported.
Why can't I have 3 or 5 chips and enable striping?


> cmdline_parm="<stripedef>[;<stripedef>]"
> <stripedef> :=
<stripename>(<interleavesize>):<subdevname>.<subdevname>
> 
>   Example:	  
>   insmod mtdstripe.ko
> cmddline_parm="stripe1(128):vol1.vol3;stripe2(128):vol2.vol4	  
>   Note: you should use '.' as a delimiter for subdevice names here.
Err, please, define the "subdevice" notion. And what is vol1, vol2, etc?

Please, describe the model of the striped MTD device from user's
perspective. I understand MTD concatenation. It just merges several MTD
devices to one larger MTD device.

May I consider your striping as another type of MTD concatenation layer
which concatenates MTD devices by means of interleaving eraseblocks?

> Subdevices should belong to different (independent) physical flash 
> chips in order to get  performance increase. Value "interlavelsize"
> describes striping granularity and it is very important from
performance
> point of view. Write operation performance increase should be expected
> only if the amount of data to be written larger than interleave size.
> For example, if we have 512 bytes interleave size, we see no write
speed
> boost for files smaller than 512 bytes. File systems have a write
buffer
> of
> well known size (let it be 4096 bytes). Thus it is not good idea to
set
> interleave size larger than 2048 byte if we are striping two flash
chips
> and going to use the file system on it. For NOR devices the bottom
> border
> for interleave size is defined by flash buffer size (64 bytes, 128
> bytes, etc).

Err, what does interleaving in sizes non-multiple to the eraseblock size
mean. Suppose my interleave value is 512. Suppose the interleaved MTD
device name is mtd7 and it concatenates 2 other MTD devices. What
happens if: 

1. I write 512 bytes at offset 0 of eraseblock 0 of mtd7
2. I write 512 bytes at offset 512 of eraseblock 0 of mtd7
3. I write 512 bytes at offset 1024 of eraseblock 0 of mtd7
4. I erase eraseblock 0 of mtd7

-- 
Best Regards,
Artem B. Bityuckiy,
St.-Petersburg, Russia.
