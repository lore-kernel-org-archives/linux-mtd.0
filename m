Received: from mail.grid-net.com ([97.65.115.18])
 by merlin.infradead.org with esmtps (Exim 4.76 #1 (Red Hat Linux))
 id 1Tvbd6-0002B0-AU
 for linux-mtd@lists.infradead.org; Wed, 16 Jan 2013 22:38:45 +0000
From: Subodh Nijsure <snijsure@grid-net.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Subject: RE: [v4] Add security.* XATTR support for the UBIFS
Date: Wed, 16 Jan 2013 22:38:31 +0000
Message-ID: <B437D8FD67C39240BFA9DD878702A627102E7E16@mx2.grid-net.com>
References: <1336915488-23943-1-git-send-email-snijsure@grid-net.com>
 <50F57A30.10109@pengutronix.de>,<50F72047.6000904@pengutronix.de>
In-Reply-To: <50F72047.6000904@pengutronix.de>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Cc: Artem Bityutskiy <dedekind1@gmail.com>,
 "penguin-kernel@I-love.SAKURA.ne.jp" <penguin-kernel@I-love.SAKURA.ne.jp>,
 Adrian Hunter <adrian.hunter@intel.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-security-module@vger.kernel.org"
 <linux-security-module@vger.kernel.org>,
 "linux-mtd@lists.infradead.org" <linux-mtd@lists.infradead.org>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>


Marc,

On 01/15/2013 04:48 PM, Marc Kleine-Budde wrote:
> On 05/13/2012 05:24 AM, Subodh Nijsure wrote:
>> From: Subodh Nijsure <snijsure@grid-net.com>
>>
>> Also fix couple of bugs in UBIFS extended attribute length calculation.
>>
>> Changes in v4:
>>         Fix lock issues introduced in v3.
>>         Tested with CONFIG_SECURITY enabled & disabled.
>>
>> Changes in v3:
>>       Remove #ifdef CONFIG_UBIFS_FS_XATTR
>>
>> Changes in v2:
>>          Instead of just handling security.selinux extended attribute ha=
ndle
>>          all security.* attributes.
>>
>> TESTING: Tested on  MX28 based platforms using Micron MT29F2G08ABAEAH4 N=
AND
>>          With these change we are able to label UBIFS filesystem with
>>          security.selinux and run system with selinux enabled.
>>          This change also allows one to set other security.* extended
>>          attributes, such as security.smack security.evm, security.ima
>>          Ran integck test on UBI filesystem.
>>          This patch set has been tested with CONFIG_LOCKDEP=3Dy and othe=
r options
>>          suggested in Submitchecklist
>>
>> Signed-off-by: Subodh Nijsure <snijsure@grid-net.com>
>
> What's the status of this patch? Was there a v5?


>I've ported v4 to v3.7.2 and get this deadlock:

Sorry I didn't try to push it and now I am on family leave to take care of =
new baby at home till end of March.=20
I don't have access to hardware any more to try this at home, so I would ce=
rtainly get to it till beginning of April.

-Subodh=
