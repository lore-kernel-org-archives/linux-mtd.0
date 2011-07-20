Message-ID: <4E26AFF4.9000208@freescale.com>
From: Huang Shijie <b32955@freescale.com>
MIME-Version: 1.0
To: Wolfram Sang <w.sang@pengutronix.de>
Subject: Re: [i.MX28 GPMI] problem overwriting all-0xff data in NAND
References: <20004.12663.29494.339601@ipc1.ka-ro>	<20110718164354.GA3328@S2100-06.ap.freescale.net>	<4E24E804.10002@freescale.com>	<20005.7677.145955.789329@ipc1.ka-ro>	<4E252C51.8070900@freescale.com>	<20005.21635.427202.49313@ipc1.ka-ro>	<4E263AF2.60103@freescale.com>
	<20110720085142.GA2377@pengutronix.de>
In-Reply-To: <20110720085142.GA2377@pengutronix.de>
Content-Type: multipart/alternative;
	boundary="------------010006070700050406010800"
Cc: linux-mtd@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
	Shawn Guo <shawn.guo@freescale.com>,
	=?UTF-8?B?TG90aGFyIFdhw59tYW5u?= <LW@KARO-electronics.de>
List-Id: Linux MTD discussion mailing list <linux-mtd.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-mtd/>
List-Post: <mailto:linux-mtd@lists.infradead.org>
List-Help: <mailto:linux-mtd-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-mtd>,
	<mailto:linux-mtd-request@lists.infradead.org?subject=subscribe>
Date: Wed, 20 Jul 2011 10:34:26 -0000

--------------010006070700050406010800
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Hi,
>>>>>>> I am debugging the DMA bug now. and I will send it out when i fix it.
>>>>>>>
>>>>>> What sort of DMA bug?
>>>>>>
>>>>> The DMA may time-out. :(
>>>>>
>>>>> The DMA time-out may occur in two situations:
>>>>> [1] send a command DMA descriptor, see the nfc->send_command() function.
>>>>> [2] read the non-ecc data from nand, see the nfc->read_data() function.
>>>>>
>>>>> I don't know why. Maybe caused by the timing, or something else.
>>> I am confused. The send-command DMA timeout prevents any write for me.
>>> You guys surely would have noticed if you have been bitten as well. Does
>>> it depend on the NAND chip?
>> I think It does not depend on the NAND chip.
>> My test chip is Samsung K9G8G08U0M.
>> Sometimes, I can run a long time while there is no DMA timeout occurring;
>> Sometimes, the bug appears right away.
> For me, the bug always happens right away. So, if you need logs or debug
> output or can give me a pointer into some direction, I am glad to
> assist.
>
Thanks a lot. :)

I am trying to merge the two DMA descriptors into one in the send_command().
The original bsp code used only one DMA descriptor.



Huang Shijie
>
>
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel


--------------010006070700050406010800
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
  </head>
  <body text="#000000" bgcolor="#ffffff">
    Hi,<br>
    <blockquote cite="mid:20110720085142.GA2377@pengutronix.de"
      type="cite">
      <pre wrap="">
</pre>
      <blockquote type="cite">
        <blockquote type="cite">
          <blockquote type="cite">
            <blockquote type="cite">
              <blockquote type="cite">
                <blockquote type="cite">
                  <pre wrap="">I am debugging the DMA bug now. and I will send it out when i fix it.

</pre>
                </blockquote>
                <pre wrap="">What sort of DMA bug?

</pre>
              </blockquote>
              <pre wrap="">The DMA may time-out. :(

The DMA time-out may occur in two situations:
[1] send a command DMA descriptor, see the nfc-&gt;send_command() function.
[2] read the non-ecc data from nand, see the nfc-&gt;read_data() function.

I don't know why. Maybe caused by the timing, or something else.
</pre>
            </blockquote>
          </blockquote>
          <pre wrap="">I am confused. The send-command DMA timeout prevents any write for me.
You guys surely would have noticed if you have been bitten as well. Does
it depend on the NAND chip?
</pre>
        </blockquote>
        <pre wrap="">I think It does not depend on the NAND chip.
My test chip is Samsung K9G8G08U0M.
Sometimes, I can run a long time while there is no DMA timeout occurring;
Sometimes, the bug appears right away.
</pre>
      </blockquote>
      <pre wrap="">
For me, the bug always happens right away. So, if you need logs or debug
output or can give me a pointer into some direction, I am glad to
assist.

</pre>
    </blockquote>
    Thanks a lot. :)<br>
    <br>
    I am trying to merge the two DMA descriptors into one in the
    send_command().<br>
    The original bsp code used only one DMA descriptor.<br>
    <br>
    <br>
    <br>
    Huang Shijie<br>
    <blockquote cite="mid:20110720085142.GA2377@pengutronix.de"
      type="cite">
      <pre wrap=""></pre>
      <pre wrap="">
<fieldset class="mimeAttachmentHeader"></fieldset>
_______________________________________________
linux-arm-kernel mailing list
<a class="moz-txt-link-abbreviated" href="mailto:linux-arm-kernel@lists.infradead.org">linux-arm-kernel@lists.infradead.org</a>
<a class="moz-txt-link-freetext" href="http://lists.infradead.org/mailman/listinfo/linux-arm-kernel">http://lists.infradead.org/mailman/listinfo/linux-arm-kernel</a>
</pre>
    </blockquote>
    <br>
  </body>
</html>

--------------010006070700050406010800--
