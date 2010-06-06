MIME-Version: 1.0
In-Reply-To: <4C0A86D9.2070106@mvista.com>
References: <4C0A13BA.6050700@gmail.com> <4C0A86D9.2070106@mvista.com>
From: Eric Miao <eric.y.miao@gmail.com>
Date: Sun, 6 Jun 2010 17:27:58 +0800
Message-ID: <AANLkTinRQ2TwU0fj2k70GdNFKmOVQ4DLc2xELu7HnnZ5@mail.gmail.com>
Subject: Re: [PATCHv2 1/3] MTD/pxa: use __devinit for pxa2xx_flash_probe
To: Sergei Shtylyov <sshtylyov@mvista.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: linux-mtd <linux-mtd@lists.infradead.org>,
	David Woodhouse <dwmw2@infradead.org>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Wan ZongShun <mcuos.com@gmail.com>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Sun, Jun 6, 2010 at 1:18 AM, Sergei Shtylyov <sshtylyov@mvista.com> wrot=
e:
> Wan ZongShun wrote:
>
>> This patch is to use the '__devinit' for pxa2xx_flash_probe.
>
> =C2=A0 Why? Is it hot-pluggable device? I guess not...
>

Then I guess the __devexit is not applicable to pxa2xx_flash_remove as well=
.
Apart from the _probe() being unnecessarily built in when HOTPLUG is
defined, is there any drawbacks. It does make code a little bit consistent
from my POV.

>> Signed-off-by: Wan ZongShun <mcuos.com@gmail.com>
>> Acked-by: Eric Miao <eric.y.miao@gmail.com>
>
> WBR, Sergei
>
>
