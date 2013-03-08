Received: from mail-oa0-f44.google.com ([209.85.219.44])
 by merlin.infradead.org with esmtps (Exim 4.80.1 #2 (Red Hat Linux))
 id 1UDyac-0003wL-RZ
 for linux-mtd@lists.infradead.org; Fri, 08 Mar 2013 14:48:12 +0000
Received: by mail-oa0-f44.google.com with SMTP id h1so2051820oag.3
 for <linux-mtd@lists.infradead.org>; Fri, 08 Mar 2013 06:48:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <518397C60809E147AF5323E0420B992E3EA92738@DBDE01.ent.ti.com>
References: <1362355040-27344-1-git-send-email-zonque@gmail.com>
 <87r4jvehcs.fsf@dell.be.48ers.dk> <5135C7D0.8010906@gmail.com>
 <518397C60809E147AF5323E0420B992E3EA92738@DBDE01.ent.ti.com>
Date: Fri, 8 Mar 2013 15:48:04 +0100
Message-ID: <CACTFLAOZ1VfDrR-Z1Z7F26WfaP=-QX7xWHDXKpmfCGbcGs6HOQ@mail.gmail.com>
Subject: Re: [PATCH v2] mtd: devices: elm: check for device's presence before
 configuration
From: Daniel Mack <zonque@gmail.com>
To: "Philip, Avinash" <avinashphilip@ti.com>
Content-Type: text/plain; charset=ISO-8859-1
Cc: "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>,
 "dwmw2@infradead.org" <dwmw2@infradead.org>,
 Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Tue, Mar 5, 2013 at 11:26 AM, Philip, Avinash <avinashphilip@ti.com> wrote:
> On Tue, Mar 05, 2013 at 15:54:16, Daniel Mack wrote:
>> On 04.03.2013 08:47, Peter Korsgaard wrote:
>> >>>>>> "Daniel" == Daniel Mack <zonque@gmail.com> writes:
>> >
>> >  Daniel> In case the driver is not probed - due to config mismatches or errors
>> >  Daniel> in the DTS files - dev_get_drvdata() returns NULL, leading to an Ooops
>> >  Daniel> during boot.
>> >
>> >  Daniel> Make elm_config() return an error in such cases to propagate the error
>> >  Daniel> up to the user, so it can fall back to software mode.
>> >
>> >  Daniel> Signed-off-by: Daniel Mack <zonque@gmail.com>
>> >  Daniel> Cc: Philip Avinash <avinashphilip@ti.com>
>> >  Daniel> Cc: Artem Bityutskiy <artem.bityutskiy@linux.intel.com>
>> >  Daniel> Cc: Peter Korsgaard <jacmet@sunsite.dk>
>> >
>> > Acked-by: Peter Korsgaard <jacmet@sunsite.dk>
>>
>> Philip, are you also ok with this?
>
> Yes.
> Thanks
> Avinash

Artem, can this go through your tree?


Thanks, everyone.

Daniel
