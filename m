MIME-Version: 1.0
In-Reply-To: <f4787f6021bf3a8c009595749894332c05e656df.1285933332.git.viresh.kumar@st.com>
References: <cover.1285933331.git.viresh.kumar@st.com>
	<f4787f6021bf3a8c009595749894332c05e656df.1285933332.git.viresh.kumar@st.com>
Date: Fri, 1 Oct 2010 21:51:06 +0530
Message-ID: <AANLkTi=xNoG2T1Q2JqB7TH+O7AjW++UnSt1Q85VgPbzp@mail.gmail.com>
Subject: Re: [PATCH V2 62/69] ST SPEAr: Appending spear3** with global
	structures
From: viresh kumar <viresh.linux@gmail.com>
To: linux-arm-kernel@lists.infradead.org, rtc-linux@googlegroups.com,
	a.zummo@towertech.it, dbrownell@users.sourceforge.net,
	linux-usb@vger.kernel.org, linux-input@vger.kernel.org,
	dmitry.torokhov@gmail.com, linux-mtd@lists.infradead.org,
	dwmw2@infradead.org,
	linux-kernel@vger.kernel.org, akpm@linux-foundation.org
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Cc: pratyush.anand@st.com, vipulkumar.samar@st.com, bhupesh.sharma@st.com,
	armando.visconti@st.com, vipin.kumar@st.com,
	shiraz.hashim@st.com, rajeev-dlh.kumar@st.com, deepak.sikri@st.com
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

On Fri, Oct 1, 2010 at 5:26 PM, Viresh KUMAR <viresh.kumar@st.com> wrote:
> Signed-off-by: Viresh Kumar <viresh.kumar@st.com>
> ---
> =C2=A0arch/arm/mach-spear3xx/include/mach/generic.h | =C2=A0140 +++++++++=
+++------------
> =C2=A0arch/arm/mach-spear3xx/spear300.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 42 ++++----
> =C2=A0arch/arm/mach-spear3xx/spear300_evb.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 43 ++++----
> =C2=A0arch/arm/mach-spear3xx/spear310.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 16 ++--
> =C2=A0arch/arm/mach-spear3xx/spear310_evb.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 37 ++++---
> =C2=A0arch/arm/mach-spear3xx/spear320.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 32 +++---
> =C2=A0arch/arm/mach-spear3xx/spear320_evb.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 |=
 =C2=A0 50 +++++----
> =C2=A0arch/arm/mach-spear3xx/spear3xx.c =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 | =C2=A0 20 ++--
> =C2=A0arch/arm/plat-spear/include/plat/spi.h =C2=A0 =C2=A0 =C2=A0 =C2=A0|=
 =C2=A0 =C2=A02 +-
> =C2=A09 files changed, 193 insertions(+), 189 deletions(-)

Hello everybody,

I have used an latest patch on git for sending this patch series. I
think there is some bug
there, due to which all of you have received some mails which are not
intended for all of you.
There was a bugfix in git which enables to send mail to "recipients
mentioned in TO field", of patch
itself.

After creating patches (with git format-patch ---), i have added To
and CC lists in patches.
But when i sent patches the TO field was carried away in later patches
too. So due to this
all patches send after rtc patches have following recipients added:
rtc-linux@googlegroups.com,
a.zummo@towertech.it. Similarly for other patches too.

Once again sorry for this.

--
viresh
