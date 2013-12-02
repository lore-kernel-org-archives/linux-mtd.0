Message-ID: <529C858B.1040601@st.com>
Date: Mon, 2 Dec 2013 13:05:15 +0000
From: srinivas kandagatla <srinivas.kandagatla@st.com>
MIME-Version: 1.0
To: Lee Jones <lee.jones@linaro.org>
Subject: Re: [PATCH v3 36/36] ARM: STi: Add support for the FSM Serial Flash
 Controller
References: <1385727565-25794-1-git-send-email-lee.jones@linaro.org>
 <1385727565-25794-37-git-send-email-lee.jones@linaro.org>
In-Reply-To: <1385727565-25794-37-git-send-email-lee.jones@linaro.org>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Cc: angus.clark@st.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 linux-mtd@lists.infradead.org, dwmw2@infradead.org,
 linux-arm-kernel@lists.infradead.org
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
 <mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>

Hi Lee,
On 29/11/13 12:19, Lee Jones wrote:
> +		/* FSM */
> +		spifsm: spifsm@fe902000{
> +		        compatible         = "st,spi-fsm", "simple-bus";
"simple-bus" is redundant here.

> +		        reg                =  <0xfe902000 0x1000>;
> +		        reg-names          = "spi-fsm";
> +		        pinctrl-0          = <&pinctrl_fsm>;
> +
> +			st,syscfg	   = <&syscfg_rear>;
> +		        st,boot-device-reg = <0x958>;
> +		        st,boot-device-spi = <0x1a>;
> +
> +		        status = "okay";
> +		};


thanks,
srini
